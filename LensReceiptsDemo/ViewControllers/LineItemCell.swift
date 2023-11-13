//
//  LineItemCell.swift
//  LensReceiptsDemo
//
//  Created by Mahesh on 11/9/23.
//

import UIKit

protocol LineItemCellDelegate: NSObjectProtocol {
    func addUser(item: RowItem?, id: Int?)
}

class LineItemCell: UITableViewCell {

    @IBOutlet weak var AddUserBtn: UIButton!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    var item: RowItem? = nil
    var id: Int? = nil
    weak var delegate:LineItemCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setup(item: RowItem, id: Int?) {
        self.item = item
        self.id = id
        if let itemPrice = item.total {
            price.text = String(itemPrice)
        }
        
        if let desc = item.description {
            name.text = desc
        }
        
        if let quan = item.quantity {
            quantity.text = String(quan)
        }
        
        if let count  = item.assignedUsers?.count, count != 0 {
            AddUserBtn.setTitle(String(count), for: .normal)
        } else {
            AddUserBtn.setTitle("Add", for: .normal)
        }
        

    }
    
    @IBAction func addUserBtnPressed(_ sender: Any) {
        delegate?.addUser(item: self.item, id: self.id)
    }
}
