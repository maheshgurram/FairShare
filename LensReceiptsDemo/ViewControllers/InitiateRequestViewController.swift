//
//  InitiateRequestViewController.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/29/23.
//

import UIKit

struct User {
    
    var name: String?
    var amount: Double?
}

class InitiateRequestViewController: UIViewController {
    
    @IBOutlet weak var splitTableView: UITableView!
    
    var selectedItemsForSplit: [RowItem]?
    var transactionNumber : Int?
    var requestDict: [String: Any] = [:]
    var topLevelArray: [Any] = []
    
    var assignedUsersGroupNames : [User] = []
    var assignedUsersGroupDict: [String: [[User]]] = [:] // [contactname: [rowitems]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupTableView()
        checkIfUserIsPresentInArray()
    }
    
    
    func setupTableView() {
        self.title = "Initiate Request"
        
        splitTableView.dataSource = self
        splitTableView.delegate = self
        splitTableView.separatorStyle = .singleLine
        splitTableView.tableFooterView = UIView()
        splitTableView.separatorColor = UIColor.blue
        splitTableView.translatesAutoresizingMaskIntoConstraints = false
        splitTableView.estimatedRowHeight = 50
        splitTableView.rowHeight = UITableView.automaticDimension
        
        splitTableView.register(UINib.init(nibName: "SplitItemWithContactsTableViewCell", bundle: nil), forCellReuseIdentifier: "SplitItemWithContactsTableViewCell")
        splitTableView.register(UINib.init(nibName: "SplitItemTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "SplitItemTableViewCell")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let requestStatusVC = segue.destination as? TransferRequestStatusViewController else { return }
        //        requestStatusVC.selectedItemsForSplit = selectedItemsForSplit
        requestStatusVC.transactionNumber = transactionNumber
    }
    
    func createFileWithDetails(transactionId: Int, name: String, amount: Double, status: String) {
        //fileName == transaction#.json
        // array of dict of every transfer
        
        var transactionDict: [String : Any] = [:]
        transactionDict["transactionId"] = transactionId
        transactionDict["name"] = name
        transactionDict["transfer_amount"] = amount
        transactionDict["status"] = status
        
        topLevelArray.append(transactionDict)
        requestDict["requests"] = topLevelArray
        
        let isSaved = try? JSONSerialization.save(jsonObject: requestDict, toFilename: "\(transactionId)")
    }
    
    
    // check here - start
    func groupByAssignedUser(rowItem: RowItem) {
        if let assignedUsers = rowItem.assignedUsers,
           let totalCost = rowItem.total,
           let quantity = rowItem.quantity {
            
            // add logic to divide the total cost
            let individualSplit = (Double(quantity) * totalCost) / Double(assignedUsers.count)
            
            if let assignedUsers = rowItem.assignedUsers {
                for user in assignedUsers {
                    if assignedUsersGroupDict[user.name ?? ""] != nil {
                        assignedUsersGroupNames.append(User(name: user.name, amount: individualSplit))
                        
                    } else {
                        assignedUsersGroupDict[user.name ?? ""] = []
                        assignedUsersGroupNames.append(User(name: user.name, amount: individualSplit))
                        assignedUsersGroupDict[user.name ?? ""]?.append(assignedUsersGroupNames)
                    }
                }
            }
        }
    }
    
    
    func checkIfUserIsPresentInArray() {
        guard let items = selectedItemsForSplit else { return }
        assignedUsersGroupNames = []
        assignedUsersGroupDict = [:]
        
        for rowItem in items {
            groupByAssignedUser(rowItem: rowItem)
        }
        print("assignedUsersGroupNames -->", assignedUsersGroupNames)
    }
    
    // end
}


extension InitiateRequestViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return selectedItemsForSplit?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = selectedItemsForSplit,
              let assignedUsers = items[section].assignedUsers else { return 0 }
        return assignedUsers.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SplitItemWithContactsTableViewCell", for: indexPath) as! SplitItemWithContactsTableViewCell
        
        if let items = selectedItemsForSplit,
           let assignedUsers = items[indexPath.section].assignedUsers,
           let totalCost = items[indexPath.section].total,
           let quantity = items[indexPath.section].quantity {
            
            // add logic to divide the total cost
            let individualSplit = (Double(quantity) * totalCost) / Double(assignedUsers.count)
            
            var isSelfUser = false
            if assignedUsers[indexPath.row].name == "Self" {
                isSelfUser = true
            }
            cell.configureView(with: assignedUsers[indexPath.row], amount: individualSplit, isSelf: isSelfUser)
            cell.delegate = self
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SplitItemTableViewCell") as? SplitItemTableViewCell else { return UIView() }
        
        if let items = selectedItemsForSplit, let title = items[section].text {
            headerView.configureView(with: title)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
}

extension InitiateRequestViewController : SendRequestDelegate {
    func sendRequestSelected(for cell: SplitItemWithContactsTableViewCell, contact: Contact?, with amount: Double?) {
        guard let index = splitTableView.indexPath(for: cell) else { return }
        
        
        // create a local file to save the details
        if let id = transactionNumber, let name = contact?.name, let amount = amount {
            createFileWithDetails(transactionId: id, name: name, amount: amount, status: "Paid")
        }
        
        /*
         // Prepare URL
         let url = URL(string: "https://rest.nexmo.com/sms/json")
         guard let requestUrl = url else { fatalError() }
         
         // Prepare URL Request Object
         var request = URLRequest(url: requestUrl)
         request.setValue("application/json", forHTTPHeaderField: "Content-Type");
         request.setValue("json", forHTTPHeaderField: "format")
         
         
         request.httpMethod = "POST"
         
         // HTTP Request Parameters which will be sent in HTTP Request Body
         //        let postString = "api_key:e1e36788&api_secret:QnaAShM9XH2Y9vPg&from:Mahender&to:917382561661&text:Testing by Mahender from App"
         let postString = [
         "api_key":"e1e36788",
         "api_secret":"QnaAShM9XH2Y9vPg",
         "to":"917382561661",
         "from":"Mahender",
         "text":"Testing by Mahender App" // transaction id, request from number, amount, request #, deep link url
         ]
         
         // Set HTTP Request Body
         request.httpBody = try? JSONSerialization.data(withJSONObject: postString, options: .withoutEscapingSlashes)
         print("body took place \( postString )")
         
         // Perform HTTP Request
         let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
         
         // Check for Error
         if let error = error {
         print("Error took place \(error)")
         return
         }
         
         // Convert HTTP Response Data to a String
         if let data = data, let dataString = String(data: data, encoding: .utf8) {
         print("Response data string:\n \(dataString)")
         }
         }
         task.resume()
         */
        
    }
    
}
