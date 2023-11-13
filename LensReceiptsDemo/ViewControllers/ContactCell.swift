//
//  ContactCell.swift
//  LensReceiptsDemo
//
//  Created by Mahesh on 11/9/23.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setup(contact: Contact) {
        name.text = contact.name
        phone.text = contact.phone
    }
    
}
