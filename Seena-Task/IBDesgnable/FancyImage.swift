//
//  CircleImage.swift
//  SocialApp
//
//  Created by OSX on 5/27/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import UIKit

class FancyImage: UIImageView {
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: 120.0 / 255.0, green: 120.0 / 255.0, blue: 120.0 / 255.0, alpha: 120.0 / 255.0).cgColor
        layer.shadowOpacity = 8.8
        layer.shadowRadius = 5.0
//        layer.borderWidth = 3
//        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }

    
}
