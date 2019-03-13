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
    
    
    // upload multi photos
    func uploadArrayOfMultiPhoto(_ imagesData: [Data],_ parameters: [String : String],_ imageParamName: String,_ toUrl: String) {
        Alamofire.upload(multipartFormData: { multipartFormData in
            // import image to request
            for imageData in imagesData {
                multipartFormData.append(imageData, withName: "\(imageParamName)[]", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
            }
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to: toUrl,
           
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    print("Done! upload_images ==>\(String.init(data: response.data!, encoding: String.Encoding.utf8))")
                    
                }
            case .failure(let error):
                print(error)
            }
            
        })
    }
    
    
    // MARK: - general request
    func getRequest(_ url : String ,completionHandler :@escaping (DataResponse<Any>) -> Void) {
        _ = Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
    }
    
    func getRequest(_ url : URL ,completionHandler :@escaping (DataResponse<Any>) -> Void) {
        _ = Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
    }
    
    
    func postRequest(_ url : String ,Parameters : [String: Any]?,completionHandler :@escaping (DataResponse<Any>) -> Void) {
        _ = Alamofire.request(url,method: .post, parameters: Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
    }
    

    
    func uploadWithImg(_ url: URL,_ para: [String:Any]?,_ img: UIImage,_ imgextention: String?,_ vc: UIViewController) {
        var type = "png"
        if imgextention == nil {
            type = "png"
        }else{
            type = imgextention!
        }
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(img.jpegData(compressionQuality: 0.2)!, withName: "image", fileName: "\(UserDefaults.standard.integer(forKey: _ID)).\(type)", mimeType: "image/\(type)")
        },
            to: url){ (result) in
                
                switch result {
                case .success(let upload, _,_ ):
                    
                    upload.uploadProgress(closure: { (progress) in
                        print("Upload Progress: \(progress.fractionCompleted)")
                        if progress.fractionCompleted == 1.0 {
                            print("===>>>upload photo completed")
                           SharedHandler.alertDialogawithPopNavigationVC(vc, "","your data is saved.", BtnTitle: "OK")

                        }
                    })
                    
                    upload.responseJSON { response in
                        
                        switch response.result {
                        case .success( _) :
                            let decoder = JSONDecoder()
                            do{
//                                
//                                let model = try decoder.decode(State_Base.self, from: response.data!)
//                                self.state = model
//                                
//                                SharedHandler.alertDialogawithPopNavigationVC(vc, "", self.state?.state?[0].state ?? "", BtnTitle: "OK")

                            }catch{
                                SharedHandler.alertDialog2lang(vc, msgEg: "invalid data Parsing.", msgAr: "خطأ في تحويل البيانات.")
                            }
                        case .failure(let error):
                            SharedHandler.alertDialogawithPopNavigationVC(vc, "", error.localizedDescription, BtnTitle: "OK")
                            
                                                    }
                    }
                case .failure(let error):
                    SharedHandler.alertDialogawithPopNavigationVC(vc, "", error.localizedDescription, BtnTitle: "OK")

                }
        }
    }
    
    func Upload(_ fileUrl:URL,_ serviceUrl:URL,_ vc: UIViewController) {
        
        Alamofire.upload(fileUrl, to: serviceUrl).responseJSON { res in
            if res.error == nil {
                //               print("@@\(String.init(data: res.data!, encoding: String.Encoding.utf8))")
                let decoder = JSONDecoder()
                do{
//
//                    let model = try decoder.decode(State_Base.self, from: res.data!)
//                    self.state = model
//
//                    SharedHandler.alertDialog(vc, "", self.state?.state?[0].state ?? "", BtnTitle: "ok")
                }catch{
                    SharedHandler.alertDialog2lang(vc, msgEg: "invalid data Parsing.", msgAr: "خطأ في تحويل البيانات.")
                }
            }else{
                
                SharedHandler.alertDialog2lang(vc, msgEg: res.error?.localizedDescription ?? "No internet connection", msgAr: "لا يوجد انترنت")
                
                
            }
        }
        
    }
    func uploadData(_ image:UIImage?,_ serviceUrl:URL,_ vc: UIViewController)  {
        let imageData = image!.pngData()!
        
        Alamofire.upload(imageData, to: serviceUrl).responseJSON { res in
            if res.error == nil {
                //               print("@@\(String.init(data: res.data!, encoding: String.Encoding.utf8))")
                let decoder = JSONDecoder()
                do{
                    
//                    let model = try decoder.decode(State_Base.self, from: res.data!)
//                    self.state = model
                    
//                    SharedHandler.alertDialog(vc, "", self.state?.state?[0].state ?? "", BtnTitle: "ok")
                }catch{
                    SharedHandler.alertDialog2lang(vc, msgEg: "invalid data Parsing.", msgAr: "خطأ في تحويل البيانات.")
                }
            }else{
                
                SharedHandler.alertDialog2lang(vc, msgEg: res.error?.localizedDescription ?? "No internet connection", msgAr: "لا يوجد انترنت")
                
                
            }

        }
    }
    func uploadWithoutFile(_ serviceUrl: URL,_ vc: UIViewController) {
        APIManager.sharedInstance.getRequest(serviceUrl) { (res) in
            if res.error == nil {
                //               print("@@\(String.init(data: res.data!, encoding: String.Encoding.utf8))")
                let decoder = JSONDecoder()
                do{
                    
//                    let model = try decoder.decode(State_Base.self, from: res.data!)
//                    self.state = model
//                    SharedHandler.alertDialog(vc, "", self.state?.state?[0].state ?? "", BtnTitle: "ok")
                }catch{
                    SharedHandler.alertDialog2lang(vc, msgEg: "invalid data Parsing.", msgAr: "خطأ في تحويل البيانات.")
                }
            }else{
                
                SharedHandler.alertDialog2lang(vc, msgEg: res.error?.localizedDescription ?? "No internet connection", msgAr: "لا يوجد انترنت")
                
            }
        }
    }
    
    func requestWith(endUrl: String, imageData: Data?, parameters: [String : Any], onCompletion: ((JSON?) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
        
        let url = "http://google.com" /* your API url */
        
        let headers: HTTPHeaders = [
            /* "Authorization": "your_access_token",  in case you need authorization header */
            "Content-type": "multipart/form-data"
        ]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            
            if let data = imageData{
                multipartFormData.append(data, withName: "image", fileName: "image.png", mimeType: "image/png")
            }
            
        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    print("Succesfully uploaded")
                    if let err = response.error{
                        onError?(err)
                        return
                    }
                    onCompletion?(nil)
                }
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
                onError?(error)
            }
        }
    }
}
