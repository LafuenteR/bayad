//
//  PromoCell.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import UIKit

class PromoCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(promo: Promo) {
        nameLabel.text = promo.name
        detailsLabel.text = promo.details
        detailsLabel.textColor = .lightGray
        if promo.read == 0 {
            self.backgroundColor = .systemGray5
        }
    }
    
}
