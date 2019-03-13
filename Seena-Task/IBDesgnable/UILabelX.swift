//
//  UILabelX.swift
//  DesignableXTesting
//
//  Created by Mark Moeykens on 1/28/17.
//  Copyright © 2017 Moeykens. All rights reserved.
//

import UIKit

@IBDesignable
class UILabelX: UILabel {
  
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
             self.clipsToBounds = true
        }
    }
    @IBInspectable public var topLeftCorner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = topLeftCorner
             self.clipsToBounds = true
            layer.maskedCorners = [.layerMinXMinYCorner]
        }
    }
    @IBInspectable public var bottomRightCorner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = bottomRightCorner
             self.clipsToBounds = true
            layer.maskedCorners = [.layerMaxXMaxYCorner]
        }
    }
    @IBInspectable public var bottomleftCorner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = bottomleftCorner
             self.clipsToBounds = true
            layer.maskedCorners = [.layerMinXMaxYCorner]
        }
    }
    @IBInspectable public var toprightCorner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = toprightCorner
             self.clipsToBounds = true 
            layer.maskedCorners = [.layerMaxXMinYCorner]
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
            
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var rotationAngle: CGFloat = 0 {
        didSet {
            self.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi / 180)
        }
    }
    
    // MARK: - Shadow Text Properties
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowColorLayer: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColorLayer.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
             self.clipsToBounds = true
        }
    }
    
    @IBInspectable public var shadowOffsetLayer: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffsetLayer
        }
    }
}
