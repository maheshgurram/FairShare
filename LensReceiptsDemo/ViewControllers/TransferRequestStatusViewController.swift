//
//  TransferRequestStatusViewController.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/29/23.
//

import UIKit

class TransferRequestStatusViewController: UIViewController {
    
    @IBOutlet weak var requestStatusTableView: UITableView!
    
    var selectedItemsForSplit: [RowItem]?
    var transactionNumber : Int?
    var requestArray: [IndividualRequestData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Request Status"
        // Do any additional setup after loading the view.
        setupTableView()
        loadStatusFromFile()
    }
    
    func setupTableView() {
        requestStatusTableView.dataSource = self
        requestStatusTableView.delegate = self
        requestStatusTableView.separatorStyle = .singleLine
        requestStatusTableView.tableFooterView = UIView()
        requestStatusTableView.separatorColor = UIColor.blue
        requestStatusTableView.translatesAutoresizingMaskIntoConstraints = false
        requestStatusTableView.estimatedRowHeight = 50
        requestStatusTableView.rowHeight = UITableView.automaticDimension
        
        requestStatusTableView.register(UINib.init(nibName: "IndividualStatusTableViewCell", bundle: nil), forCellReuseIdentifier: "IndividualStatusTableViewCell")
        
    }
    
    func loadStatusFromFile() {
        guard let transactionNumber = transactionNumber else { return }
        let json = try? JSONSerialization.loadJSON(withFilename: "\(transactionNumber)") as? [String : Any]
        parseJsonData(json)
    }
    
    func parseJsonData(_ json: [String : Any]?) {
        if let jsonData = json,
           let data = try? JSONSerialization.data(withJSONObject: jsonData, options: [.prettyPrinted]) {
            
            let requestData = try? JSONDecoder().decode(RequestData.self, from: data)
            requestArray = requestData?.data
            
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension TransferRequestStatusViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "IndividualStatusTableViewCell", for: indexPath) as! IndividualStatusTableViewCell
        
        if let items = selectedItemsForSplit,
           let assignedUsers = items[indexPath.section].assignedUsers,
           let totalCost = items[indexPath.section].total,
           let quantity = items[indexPath.section].quantity {
            
            // add logic to divide the total cost
            let individualSplit = (Double(quantity) * totalCost) / Double(assignedUsers.count)
            
            var status = ""
            if let requestArray = requestArray {
                for eachRequest in requestArray {
                    print("eachRequest ->", eachRequest)
                    status = assignedUsers[indexPath.row].name == eachRequest.name ? eachRequest.status ?? "Pending" : "Pending"
                }
            }
            
            cell.configureView(with: assignedUsers[indexPath.row], amount: individualSplit, status: status)
            //            cell.delegate = self
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
