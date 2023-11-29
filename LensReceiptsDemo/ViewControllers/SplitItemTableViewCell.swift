//
//  SplitItemTableViewCell.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 11/29/23.
//

import UIKit

class SplitItemTableViewCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureView(with title: String) {
        itemNameLabel.text = title
        
    }
    
}
