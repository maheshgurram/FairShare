//
//  OverviewViewController.swift
//  LensReceiptsDemo
//
//  Created by mahender.r.gurram on 12/12/23.
//

import Foundation
import UIKit

class OverviewViewController: UIViewController {
    
    var price = 0.0
    var currency = "$"
    var status = "pending" //pending, approved
    let CONST_PENDING = "pending"

    var requester = "Sandeep"
    var approver = "Mahesh"
    
    @IBOutlet weak var lblTo: UILabel!
    @IBOutlet weak var viewStepsBg: UIView!
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var viewBgTop: UIView!

    
    @IBOutlet weak var step1: UIView!
    @IBOutlet weak var step1Header: UILabel!
    @IBOutlet weak var step1Description: UILabel!
    @IBOutlet weak var step1Date: UILabel!
    @IBOutlet weak var step1ImgView: UIImageView!
    
    @IBOutlet weak var step2: UIView!
    @IBOutlet weak var step2Header: UILabel!
    @IBOutlet weak var step2Description: UILabel!
    @IBOutlet weak var step2Date: UILabel!
    @IBOutlet weak var step2ImgView: UIImageView!
    
    @IBOutlet weak var step3: UIView!
    @IBOutlet weak var step3Header: UILabel!
    @IBOutlet weak var step3Description: UILabel!
    @IBOutlet weak var step3Date: UILabel!
    @IBOutlet weak var step3ImgView: UIImageView!
    
    @IBOutlet weak var step4: UIView!
    @IBOutlet weak var step4Header: UILabel!
    @IBOutlet weak var step4Description: UILabel!
    @IBOutlet weak var step4Date: UILabel!
    @IBOutlet weak var step4ImgView: UIImageView!
    
    @IBOutlet weak var step5: UIView!
    @IBOutlet weak var step5Header: UILabel!
    @IBOutlet weak var step5Description: UILabel!
    @IBOutlet weak var step5Date: UILabel!
    @IBOutlet weak var step5ImgView: UIImageView!
    
    override func viewDidLoad() {
        configureSteps()
        viewBgTop.backgroundColor = .white
        viewBgTop.layer.shadowColor = UIColor.gray.cgColor
        viewBgTop.layer.shadowOpacity = 0.3
        viewBgTop.layer.shadowOffset = CGSize.zero
        viewBgTop.layer.shadowRadius = 6
        
        viewStepsBg.layer.shadowColor = UIColor.gray.cgColor
        viewStepsBg.layer.shadowOpacity = 0.2
        viewStepsBg.layer.shadowOffset = CGSize.zero
        viewStepsBg.layer.shadowRadius = 5
        
    }
    
    func configureSteps() {
        lblTo.text = "From " + approver
        
        lblPrice.text = currency + String(price.rounded(toPlaces: 2))
        configureStep1()
        configureStep2()
        configureStep3()
        configureStep4()
        configureStep5()
    }
    //exclamationmark.triangle.fill
    func configureStep1() {
        
        step1Description.text = "Request initiated from \(requester) credit card to \(requester) checking account."
        step1Date.text = Date().string(format: "MMM d, h:mm a")
    }
    
    func configureStep2() {
        step2Description.text = "Zelle request sent from \(requester) checking account to \(approver) checking account for \(currency)\(price.rounded(toPlaces: 2))"
        step2Date.text = Date().string(format: "MMM d, h:mm a")

    }
    func configureStep3() {
        step3Description.text = "\(approver) Accepted"
        step3Date.text = Date().string(format: "MMM d, h:mm a")
        if status == CONST_PENDING
        {
            step3ImgView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        }


    }
    func configureStep4() {
        step4Description.text = "\(currency)\(price.rounded(toPlaces: 2)) transferred from \(approver) checking account to \(requester) checking account"
        step4Date.text = Date().string(format: "MMM d, h:mm a")
        if status == CONST_PENDING
        {
            step4ImgView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        }


    }
    func configureStep5() {
        step5Description.text = "Auto transferred \(currency)\(price.rounded(toPlaces: 2)) from \(requester) checking account to \(requester) credit card"
        step5Date.text = Date().string(format: "MMM d, h:mm a")
        if status == CONST_PENDING
        {
            step5ImgView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        }

    }
    
    
    
    
}

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
