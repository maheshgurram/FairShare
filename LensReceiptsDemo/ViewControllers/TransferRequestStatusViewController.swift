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
        return 1 //selectedItemsForSplit?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let items = selectedItemsForSplit,
//              let assignedUsers = items[section].assignedUsers else { return 0 }
        return requestArray?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IndividualStatusTableViewCell", for: indexPath) as! IndividualStatusTableViewCell
        
        if let items = requestArray,
           let assignedUsers = items[indexPath.row].name,
           let amount = items[indexPath.row].transferAmount,
           let status = items[indexPath.row].status {
            
            cell.configureView(with: assignedUsers, amount: amount, status: status)
            //            cell.delegate = self
        }
        
        return cell
    }
    
    // Remove this header and group by same person
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
