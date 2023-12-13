//
//  DashboardViewController.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/15/23.
//

import UIKit

class DashboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func clearDataSelected(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        do {
            if let url = urls.first {
                guard let filePaths = try? fm.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: []) else { return }
                for filePath in filePaths {
                    try fm.removeItem(at: filePath)
                }
            }
        } catch {
            return
        }
    }
    
    
}
