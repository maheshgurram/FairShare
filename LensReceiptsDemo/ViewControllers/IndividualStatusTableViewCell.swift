//
//  IndividualStatusTableViewCell.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/29/23.
//

import UIKit

class IndividualStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var requestedAmountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView() {
        
    }
    
}
