//
//  SplitItemWithContactsTableViewCell.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/29/23.
//

import UIKit

protocol SendRequestDelegate: NSObjectProtocol {
    func sendRequestSelected(for cell: SplitItemWithContactsTableViewCell, contact: Contact?, with amount: Double?)
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

    func configureView(with contact: Contact, isSelf: Bool) {
        self.contact = contact
        contactNameLabel.text = contact.name
        amountLabel.text = "owes  \(contact.total ?? 0)"
        isSelf ? requestButton.setTitle("Auto Settle", for: .normal) : requestButton.setTitle("Send Request", for: .normal)
    }
    
    @IBAction func sendRequestButtonClicked(_ sender: UIButton) {
        requestButton.isEnabled = false
        delegate?.sendRequestSelected(for: self, contact: contact, with: contact?.total)
        
    }
}
