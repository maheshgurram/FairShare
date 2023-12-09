//
//  ContactsVC.swift
//  LensReceiptsDemo
//
//  Created by Mahesh on 11/9/23.
//

import UIKit

protocol ContactsVCDelegate: NSObjectProtocol {
    func selUsers(contacts: [Contact]?)
}

class ContactsVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var contactsTableView: UITableView!
    
    var contacts: [Contact] = []
    var selectedContacts: [Contact]? 
    
    weak var delegate:ContactsVCDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        setupUI()
    }
    
    func setupUI() {
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        contactsTableView.separatorStyle = .singleLine
        contactsTableView.tableFooterView = UIView()
        contactsTableView.separatorColor = UIColor.blue
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.estimatedRowHeight = 50
        contactsTableView.rowHeight = UITableView.automaticDimension
        contactsTableView.allowsMultipleSelection = true
        contactsTableView.allowsMultipleSelectionDuringEditing = true
        
        title = "Contacts"
            
        let nib = UINib.init(nibName: "ContactCell", bundle: nil)
        self.contactsTableView.register(nib, forCellReuseIdentifier: "ContactCell")
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.selUsers(contacts: selectedContacts)
        navigationController?.popViewController(animated: true)

    }
    
    func checkSelected(for contact: Contact) -> Bool {
        guard let selectedContacts = selectedContacts else { return false }
        var isSelected = false
        let selectedContact = selectedContacts.filter({ $0.name == contact.name })
        isSelected = selectedContact.count > 0 ? true : false
        return isSelected
        
    }
    

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell

        // Configure the cell...
        cell.setup(contact:  contacts[indexPath.row])
        if checkSelected(for: contacts[indexPath.row]) == true {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Send the selected contact back to receipt VC
        let selContact = contacts[indexPath.row]
        selectedContacts?.append(selContact)
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // remove contact from selContacts array
        if let index = selectedContacts?.firstIndex(where: { $0.name == contacts[indexPath.row].name }) {
            selectedContacts?.remove(at: index)
        }
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

