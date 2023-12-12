//
//  ReceiptVC.swift
//  LensReceiptsDemo
//
//  Created by Mahesh on 11/9/23.
//

import UIKit
import ContactsUI

class ReceiptVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var receiptTableView: UITableView!
    
    var rowItems: [RowItem]?
    var contacts: [Contact] = []
    var selRowItem: Int? = nil
    var transactionNumber: Int?
    var isSplitEqual: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        setupUI()
    }
    
    func setupUI() {
        receiptTableView.dataSource = self
        receiptTableView.delegate = self
        receiptTableView.separatorStyle = .singleLine
        receiptTableView.tableFooterView = UIView()
        receiptTableView.separatorColor = UIColor.blue
        receiptTableView.translatesAutoresizingMaskIntoConstraints = false
        receiptTableView.estimatedRowHeight = 50
        receiptTableView.rowHeight = UITableView.automaticDimension
                    
        let nib = UINib.init(nibName: "LineItemCell", bundle: nil)
        self.receiptTableView.register(nib, forCellReuseIdentifier: "LineItemCell")
    }
    
    func createSelfContact() -> Contact {
        var selfUser = Contact()
        selfUser.name = "Self"
        selfUser.phone = "9081238975"
        return selfUser
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let initiateRequestVC = segue.destination as? InitiateRequestViewController else { return }
        
        if let items = rowItems {
            var selectedItems = items.filter{ item in item.assignedUsers?.count ?? 0 > 0 }
            if let isSplitEqual = isSplitEqual, isSplitEqual {
                selectedItems[0].assignedUsers?.append(createSelfContact())
            }
            initiateRequestVC.selectedItemsForSplit = selectedItems
            initiateRequestVC.transactionNumber = self.transactionNumber
        }
        
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowItems?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LineItemCell", for: indexPath) as! LineItemCell

        // Configure the cell...
        if let lineItem = rowItems?[indexPath.row] {
            cell.setup(item: lineItem, id: indexPath.row)
            cell.delegate = self
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ReceiptVC: LineItemCellDelegate {
    func addUser(item: RowItem?, id: Int?) {
        // Launch contact info to get contact information
        
        selRowItem = id
        
        if contacts.count == 0 {
            pullContacts()
        }
        
        // launch contacts list screen
        
        guard let vc = UIStoryboard(name: "Contacts", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContactsVC") as? ContactsVC else { return }
        // Filter out items which doens't have total
        vc.contacts = self.contacts
        
        if let index = selRowItem, let selectedRow = rowItems?[index] {
            vc.selectedContacts = selectedRow.assignedUsers

        }
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }

    
    func pullContacts() {
            
            let store = CNContactStore()
            
            store.requestAccess(for: CNEntityType.contacts) { hasPermission, error in
                  if error != nil {
                       print(error!)
                  }
             }
            
            if (CNContactStore.authorizationStatus(for: CNEntityType.contacts) == .authorized) {
                                     
                let request = CNContactFetchRequest(keysToFetch: [
                    CNContactGivenNameKey as CNKeyDescriptor,
                    CNContactFamilyNameKey as CNKeyDescriptor,
                    CNContactEmailAddressesKey as CNKeyDescriptor,
                    CNContactPhoneNumbersKey as CNKeyDescriptor
                ])
                
                request.sortOrder = CNContactSortOrder.givenName
                 
                
                do {
                    try store.enumerateContacts(with: request) {
                        (contact, stop) in
                        if let phone = contact.phoneNumbers.first?.value.stringValue {
                            var cont = Contact(name: contact.givenName + " " + contact.familyName, phone: phone)
                            self.contacts.append(cont)
                        }
                        
                    }
                    
                } catch {
                    print("error: \(error)")
                }
            }
        }
    
    
}

extension ReceiptVC: ContactsVCDelegate {
    
    func selUsers(contacts: [Contact]?) {
        // Received the sel User
        if let contact = contacts, let id = selRowItem {
            
            rowItems?[id].assignedUsers = contact
            self.receiptTableView.reloadData()
        }
    }
}


