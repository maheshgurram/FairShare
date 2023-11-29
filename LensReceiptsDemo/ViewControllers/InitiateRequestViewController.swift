//
//  InitiateRequestViewController.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/29/23.
//

import UIKit

class InitiateRequestViewController: UIViewController {

    @IBOutlet weak var splitTableView: UITableView!
    
    var selectedItemsForSplit: [RowItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupTableView()
    }
    

    func setupTableView() {
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
        requestStatusVC.selectedItemsForSplit = selectedItemsForSplit
        
        
    }


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
            
            cell.configureView(with: assignedUsers[indexPath.row], amount: individualSplit)
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
    func sendRequestSelected(for contact: Contact?, with amount: Double?) {
        //
    }
    
    
}
