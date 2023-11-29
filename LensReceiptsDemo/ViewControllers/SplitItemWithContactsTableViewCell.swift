//
//  SplitItemWithContactsTableViewCell.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/29/23.
//

import UIKit

protocol SendRequestDelegate: NSObjectProtocol {
    func sendRequestSelected(for contact: Contact?, with amount: Double?)
}

class SplitItemWithContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var requestButton: UIButton!
    
    weak var delegate: SendRequestDelegate? = nil
    var contact: Contact? = nil
    var amount: Double? = nil

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureView(with contact: Contact, amount: Double) {
        self.contact = contact
        self.amount = amount
        contactNameLabel.text = contact.name
        amountLabel.text = "owes  \(amount)"
    }
    
    @IBAction func sendRequestButtonClicked(_ sender: Any) {
        delegate?.sendRequestSelected(for: contact, with: amount)
        
    }
}
