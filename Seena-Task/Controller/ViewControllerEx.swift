//
//  ViewControllerEx.swift
//  Seena-Task
//
//  Created by a7med on 3/13/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionData.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configure(false, "\(collectionData[indexPath.row].min_fees ?? 0) EGP", "\(collectionData[indexPath.row].followers ?? 0)", "\(collectionData[indexPath.row].speciality ?? "")",  "\(collectionData[indexPath.row].name ?? "" )",  "\(collectionData[indexPath.row].image ?? "")")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == collectionData.count && moreData {
            getAllDoctors()
        }
    }
    
}
