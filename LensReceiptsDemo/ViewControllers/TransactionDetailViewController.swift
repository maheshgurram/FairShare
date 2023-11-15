//
//  TransactionDetailViewController.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/15/23.
//

import UIKit

class TransactionDetailViewController: UIViewController {

    @IBOutlet weak var splitButton: UIButton!
    
    
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
    }
    


}
