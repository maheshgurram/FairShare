//
//  TransactionDetailViewController.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/15/23.
//

import UIKit

class TransactionDetailViewController: UIViewController {

    @IBOutlet weak var splitButton: UIButton!
    @IBOutlet weak var splitEqualButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        setupUI()

    }
    
    private func setupUI() {
        splitButton.layer.cornerRadius = 14
        splitButton.layer.masksToBounds = true
        splitButton.clipsToBounds = true
        
        splitEqualButton.layer.cornerRadius = 14
        splitEqualButton.layer.masksToBounds = true
        splitEqualButton.clipsToBounds = true

    }
    
    @IBAction func splitEqualButtonTapped(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Receipts", bundle: Bundle.main).instantiateViewController(withIdentifier: "ReceiptVC") as? ReceiptVC else { return }

        // Create RowItem
        var rowItem = RowItem()
        rowItem.text = "TWIN ROCKS SPRING WATER"
        rowItem.total = 39.95
        rowItem.quantity = 1
        rowItem.description = "TWIN ROCKS SPRING WATER"
        rowItem.assignedUsers = []
        
        vc.rowItems = [rowItem]
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
