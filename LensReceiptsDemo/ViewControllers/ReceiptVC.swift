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
    
    var receiptData: ReceiptData? = nil
    var contacts: [Contact] = []
    var selRowItem: Int? = nil
    
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
        
        title = receiptData?.data?.vendor?.rawName
            
        let nib = UINib.init(nibName: "LineItemCell", bundle: nil)
        self.receiptTableView.register(nib, forCellReuseIdentifier: "LineItemCell")
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return receiptData?.data?.items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LineItemCell", for: indexPath) as! LineItemCell

        // Configure the cell...
        if let lineItem = receiptData?.data?.items?[indexPath.row] {
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
   
    func selUser(contact: Contact?) {
        // Received the sel User
        
        if let cont = contact, let id = selRowItem {
            receiptData?.data?.items?[id].assignedUsers?.append(cont)
            self.receiptTableView.reloadData()
        }
        
        
    }
}


