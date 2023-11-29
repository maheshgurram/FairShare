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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Request Status"
        // Do any additional setup after loading the view.
        setupTableView()

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
            
            cell.configureView(with: assignedUsers[indexPath.row], amount: individualSplit)
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
