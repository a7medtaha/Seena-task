//
//  TableViewCell.swift
//  Seena-Task
//
//  Created by a7med on 3/13/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var isRecommended: UIImageView!
    @IBOutlet weak var priceLbl: UIButton!
    @IBOutlet weak var followersNumber: UILabel!
    @IBOutlet weak var specialistLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imageCell: UIImageViewX!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        imageCell.clipsToBounds = true
        imageCell.layer.cornerRadius = 10
    }
    
    func configure(_ isRecommended: Bool,_ price: String,_ followers: String, _ specailist: String,_ name: String,_ imageUrl: String)  {
        self.isRecommended.image = #imageLiteral(resourceName: "recommended")
        self.isRecommended.isHidden = isRecommended
        self.nameLbl.text = name
        self.followersNumber.text = followers
        self.priceLbl.setTitle(price, for: .normal)
        self.priceLbl.setImage(#imageLiteral(resourceName: "banknote"), for: .normal)
        self.specialistLbl.text = specailist
        DispatchQueue.main.async {
            self.imageCell.sd_setImage(with: URL(string: imageUrl), completed: nil)
        }
        
    }

}
