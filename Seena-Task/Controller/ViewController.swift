//
//  ViewController.swift
//  Seena-Task
//
//  Created by a7med on 3/13/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var collectionData: [Response] = []
    var moreData = true
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllDoctors() 
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func getAllDoctors()  {
        self.table.isHidden = true
        self.spinner.isHidden = false
        self.spinner.startAnimating()
        APIManager.sharedInstance.postRequest(taskUrl, Parameters: nil) { (res) in
            if res.error == nil {
                let decoder = JSONDecoder()
                do{
                    let model = try decoder.decode(Response_Base.self, from: res.data!)
                    if (model.response?.count) ?? 0 > 0{
                        self.collectionData += model.response ?? []
                        self.moreData = true
                        self.table.reloadData()


                    }else if  self.collectionData.count == 0{
                        self.table.isHidden = true
                        self.createLabelNoResult()
                    }else{
                         self.moreData = false
                    }
                    
                    
                    
                print(" Collection Data ==>> \(self.collectionData)")
                }catch{
                   self.DisAppearMessage(message: error.localizedDescription)
                }
                self.table.isHidden = false
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
            }else{
                // handle error
                self.DisAppearMessage(message: (res.error?.localizedDescription)!)
            }
        }
    }

    
    
    
    

}

