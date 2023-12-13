//
//  TransactionDetailViewController.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/15/23.
//

import UIKit

class TransactionDetailViewController: UIViewController {
    
    @IBOutlet weak var transactionDetailImageView: UIImageView!
    @IBOutlet weak var splitButton: UIButton!
    @IBOutlet weak var splitEqualButton: UIButton!
    var isJSONFile5708Present: Bool = false
    var isJSONFile5709Present: Bool = false
    var isSplitItemized: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        setupUI()
        
        
#if targetEnvironment(simulator)
    if let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
        print("Documents Directory: \(documentsPath)")
    }
#endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isSplitItemized {
            let json = try? JSONSerialization.loadJSON(withFilename: "5708") as? [String : Any]
            if json?.keys != nil {
                isJSONFile5708Present = true
                splitButton.isHidden = true
                splitEqualButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                splitEqualButton.setTitle("VIEW STATUS", for: .normal)

            } else {
                isJSONFile5708Present = false
                splitButton.isHidden = false
                splitEqualButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                splitEqualButton.setTitle("SPLIT EQUAL", for: .normal)
                splitButton.setTitle("SPLIT", for: .normal)
            }

        } else {
            let json = try? JSONSerialization.loadJSON(withFilename: "5709") as? [String : Any]
            if json?.keys != nil {
                isJSONFile5709Present = true
                splitButton.isHidden = true
                splitEqualButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                splitEqualButton.setTitle("VIEW STATUS", for: .normal)

            } else {
                isJSONFile5709Present = false
                splitButton.isHidden = false
                splitEqualButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                splitEqualButton.setTitle("SPLIT EQUAL", for: .normal)
                splitButton.setTitle("SPLIT", for: .normal)
                
            }

        }
        
    }
    
    private func setupUI() {
        splitButton.layer.cornerRadius = 14
        splitButton.layer.masksToBounds = true
        splitButton.clipsToBounds = true
        
        splitEqualButton.layer.cornerRadius = 14
        splitEqualButton.layer.masksToBounds = true
        splitEqualButton.clipsToBounds = true
        
        if isSplitItemized {
            transactionDetailImageView.image = UIImage(named: "SplitItemizedTransactionDetailScreen")
        } else {
            transactionDetailImageView.image = UIImage(named: "TransactionDetailScreen")
        }
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let verifyVC = segue.destination as? ViewController else { return }
//        verifyVC.transactionNumber = 5708
//        
//    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
// SPLIT EQUAL = 5709 = 6.17
// SPLIT ITEMIZED = 5708 = 10.95
    
    
    @IBAction func splitButtonTapped(_ sender: Any) {
        if isJSONFile5708Present {
            guard let vc = UIStoryboard(name: "Receipts", bundle: Bundle.main).instantiateViewController(withIdentifier: "TransferRequestStatusVC") as? TransferRequestStatusViewController else { return }
            vc.transactionNumber = 5708
            
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            guard let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewControllerVC") as? ViewController else { return }
            vc.transactionNumber = 5708
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func splitEqualButtonTapped(_ sender: Any) {
        if isJSONFile5709Present {
            guard let vc = UIStoryboard(name: "Receipts", bundle: Bundle.main).instantiateViewController(withIdentifier: "TransferRequestStatusVC") as? TransferRequestStatusViewController else { return }
            vc.transactionNumber = 5709
            
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            guard let vc = UIStoryboard(name: "Receipts", bundle: Bundle.main).instantiateViewController(withIdentifier: "ReceiptVC") as? ReceiptVC else { return }
            
            // Create RowItem
            var rowItem = RowItem()
            rowItem.text = "CHICK-FIL-A #04591"
            rowItem.total = 6.17
            rowItem.quantity = 1
            rowItem.description = "CHICK-FIL-A #04591"
            rowItem.assignedUsers = []
            vc.rowItems = [rowItem]
            
            vc.transactionNumber = 5709
            vc.isSplitEqual = true
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
