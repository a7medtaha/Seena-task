//
//  HelpEx.swift
//  Seena-Task
//
//  Created by a7med on 3/13/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

extension ViewController{
    
     func createLabelNoResult(){
        // CGRectMake has been deprecated - and should be let, not var
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width , height: 60 ))
        
        // you will probably want to set the font (remember to use Dynamic Type!)
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        
        // and set the text color too - remember good contrast
        label.textColor = .black
        
        // may not be necessary (e.g., if the width & height match the superview)
        // if you do need to center, CGPointMake has been deprecated, so use this
        label.center = CGPoint(x: self.view.frame.width / 2.0, y: self.view.frame.height / 2.0)
        
        // this changed in Swift 3 (much better, no?)
        label.textAlignment = .center
        label.font = label.font.withSize(18)
            label.text = "No Data."
    
                self.view.addSubview(label)
    }
    
    func DisAppearMessage(message: String){
        let alert = UIAlertController(title: "Alert", message: message , preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
