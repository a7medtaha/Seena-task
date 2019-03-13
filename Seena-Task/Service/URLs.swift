//
//  URLs.swift
//  wuzfone
//
//  Created by Donna on 10/6/18.
//  Copyright © 2018 Madonna. All rights reserved.
//

import Foundation

class URLs{
    
    static let url   = "http://tijaragcc.com/api/"
    
    static let index     = url   + "index/\(SharedHandler.getLanguage())"
    static let calls     = url   + "call_history"
    static let chats     = url   + "inbox/\(SharedHandler.getLanguage())"
     static let get_nots     = url   + "get_nots/\(SharedHandler.getLanguage())"
   //cats_search contact_phones get_nots get_support_messages
    static let updateProfile     = url   + "update_profile"
    static let get_support_messages     = url   + "get_support_messages/\(SharedHandler.getLanguage())"
    static let chatMsg     = url   + "message/store"
    static let cats_search     = url   + "cats_search/\(SharedHandler.getLanguage())?name="

    static let store     = url   + "ad/store"
    static let contact_phones     = url   + "contact_phones"
    static let show_ad     = url   + "show_ad/\(SharedHandler.getLanguage())"
        static let ad_data     = url   + "ad_data/\(SharedHandler.getLanguage())"
    static let ads    = url   + "ads/\(SharedHandler.getLanguage())"

     static let get_subcats     = url   + "get_subcats/\(SharedHandler.getLanguage())"
    static let offers     = url   + "offers/\(SharedHandler.getLanguage())"
    static let about     = url   + "about/\(SharedHandler.getLanguage())"
    static let terms     = url   + "terms/\(SharedHandler.getLanguage())"
      static let login     = url   + "login"
    //code_resend
    static let forgetPassword     = url   + "code_resend"
        static let sub_cats     = url   + "sub_cats/\(SharedHandler.getLanguage())"
     static let register     = url   + "register"
    static func getImageUrl(_ folderName: String , _ imageName: String) -> String {
        return "http://tijaragcc.com/\(folderName)/\(imageName)"
    }
   
    enum propertiseUrl: String {
        case favs = "show_favs"
        case watched = "visited_recent"
        case ads = "my_ads"
        func pro() ->String {
            print("row ==> \(self.rawValue)")
            return "\(url)\(self.rawValue)" }
    }

    

    
  
}
