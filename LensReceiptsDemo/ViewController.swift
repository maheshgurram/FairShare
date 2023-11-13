//
//  ViewController.swift
//  LensReceiptsDemo
//
//  Created by Diego Giraldo on 24/03/22.
//

import UIKit
import VeryfiLens

class ViewController: UIViewController {
    @IBOutlet weak var logsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let CLIENT_ID = "vrfYhNuWenXeFdsKPLICX3SFRR0hmzTsRXdBjDR" //getEnvironmentVar(key: "vrfYhNuWenXeFdsKPLICX3SFRR0hmzTsRXdBjDR") // replace with your assigned Client Id
        let AUTH_USERNAME = "mahesh.gurram12"// getEnvironmentVar(key: "mahesh.gurram12") // replace with your assigned Username
        let AUTH_APIKEY = "919256d764351d8202b56e15af8886c7" // getEnvironmentVar(key: "919256d764351d8202b56e15af8886c7") // replace with your assigned API Key
        let URL = "https://api.veryfi.com" // getEnvironmentVar(key: "https://api.veryfi.com/") // replace with your assigned Endpoint URL

        let credentials = VeryfiLensCredentials(clientId: CLIENT_ID,
                                                          username: AUTH_USERNAME,
                                                          apiKey: AUTH_APIKEY,
                                                          url: URL)
        let settings = VeryfiLensSettings()
        settings.documentTypes = ["receipt", "bill"]
        settings.showDocumentTypes = true
        
        VeryfiLens.shared().delegate = self
        
        VeryfiLens.shared().configure(with: credentials, settings: settings)
    }


    @IBAction func launchLens(_ sender: Any) {
        // this can be used to scan new receipt
//        VeryfiLens.shared().showCamera(in: self)
        
        // USe this to avoid uploading receipt
        let json = try? JSONSerialization.loadJSON(withFilename: "receipt") as? [String : Any]
        parseReceiptData(json)
    }
    
    func string(from json: [String : Any]) -> String? {
        let jsonData = try? JSONSerialization.data(withJSONObject: json as Any, options: .prettyPrinted)
        return String(data: jsonData!, encoding: .utf8)
    }
    
    //Func to get environment variables.
    func getEnvironmentVar(key: String) -> String {
        return Bundle.main.object(forInfoDictionaryKey: key) as? String ?? ""
    }
    
    func parseReceiptData(_ json: [String : Any]!) {
        
        let data = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        
        let receiptData = try? JSONDecoder().decode(ReceiptData.self, from: data!)
        
        if let items = receiptData?.data?.items {
            for item in items {
                print("\(item.quantity ?? 0) --- \(item.description ?? "" ) ----- \(item.total ?? 0)")
            }
        }
        
        // Navigate to Receipt view page
        
        guard let vc = UIStoryboard(name: "Receipts", bundle: Bundle.main).instantiateViewController(withIdentifier: "ReceiptVC") as? ReceiptVC else { return }
        // Filter out items which doens't have total
        vc.receiptData = receiptData
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

extension ViewController: VeryfiLensDelegate {
    func veryfiLensClose(_ json: [String : Any]!) {
        if let string = string(from: json) {
            logsTextView.text.append("\n\(string)")
        }
    }
    
    func veryfiLensError(_ json: [String : Any]!) {
        if let string = string(from: json) {
            logsTextView.text.append("\n\(string)")
        }
    }
    
    func veryfiLensSuccess(_ json: [String : Any]!) {
        
        let isSaved = try? JSONSerialization.save(jsonObject: json, toFilename: "receipt")
        parseReceiptData(json)
        
        if let string = string(from: json) {
            logsTextView.text.append("\n\(string)")
        }
    }
    
    func veryfiLensUpdate(_ json: [String : Any]!) {
        if let string = string(from: json) {
            logsTextView.text.append("\n\(string)")
        }
    }
}



