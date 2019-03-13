//
//  apiManager.swift
//  wuzfone
//
//  Created by Donna on 10/6/18.
//  Copyright © 2018 Madonna. All rights reserved.
//

import UIKit
//
//  apiManager.swift
//  adabBook
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Madonna. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {

    //MARK: - Singlton
    class var sharedInstance : APIManager {
        struct Singlton {
            static let instance = APIManager()
        }
        
        return Singlton.instance
        
        
    }
    
    
    
    func postRequest(_ url : String ,Parameters : [String: Any]?,completionHandler :@escaping (DataResponse<Any>) -> Void) {
        _ = Alamofire.request(url,method: .post, parameters: Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
    }
    
}
