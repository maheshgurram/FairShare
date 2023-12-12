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
    var isJSONFilePresent: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let json = try? JSONSerialization.loadJSON(withFilename: "5709") as? [String : Any]
        if json != nil {
            isJSONFilePresent = true
            splitButton.isHidden = true
            splitEqualButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            splitEqualButton.setTitle("VIEW STATUS", for: .normal)

        } else {
            isJSONFilePresent = false
            splitButton.isHidden = false
            splitEqualButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            splitEqualButton.setTitle("SPLIT EQUAL", for: .normal)
            splitButton.setTitle("SPLIT", for: .normal)
            
        }
        
    }
    
    private func setupUI() {
        splitButton.layer.cornerRadius = 14
        splitButton.layer.masksToBounds = true
        splitButton.clipsToBounds = true
        
        splitEqualButton.layer.cornerRadius = 14
        splitEqualButton.layer.masksToBounds = true
        splitEqualButton.clipsToBounds = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let verifyVC = segue.destination as? ViewController else { return }
        
        verifyVC.transactionNumber = 5708
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func splitEqualButtonTapped(_ sender: Any) {
        if isJSONFilePresent {
            guard let vc = UIStoryboard(name: "Receipts", bundle: Bundle.main).instantiateViewController(withIdentifier: "TransferRequestStatusVC") as? TransferRequestStatusViewController else { return }
            vc.transactionNumber = 5709
            
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            guard let vc = UIStoryboard(name: "Receipts", bundle: Bundle.main).instantiateViewController(withIdentifier: "ReceiptVC") as? ReceiptVC else { return }
            
            // Create RowItem
            var rowItem = RowItem()
            rowItem.text = "TWIN ROCKS SPRING WATER"
            rowItem.total = 39.95
            rowItem.quantity = 1
            rowItem.description = "TWIN ROCKS SPRING WATER"
            rowItem.assignedUsers = []
            vc.rowItems = [rowItem]
            
            vc.transactionNumber = 5709
            vc.isSplitEqual = true
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
