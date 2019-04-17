//
//  Loanee.swift
//  loaner
//
//  Created by Thomas Vandegriff on 3/13/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//

import UIKit

public class Loanee: NSObject, NSCoding {
    
    var name: String
    var contactNumber: String?
    
    enum Keys: String {
        case name = "name"
        case contactNumber = "contactNumber"
    }
    
    init(name: String, contactNumber: String?) {
        
        /** For Future Feature: Ability to access Contacts app:
         init(name: String, profileImage: UIImage, contactNumber: String?) {
         
         self.profileImage = profileImage
         **/
        
        self.name = name
        self.contactNumber = contactNumber
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Keys.name.rawValue)
        aCoder.encode(contactNumber, forKey: Keys.contactNumber.rawValue)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: Keys.name.rawValue) as! String
        contactNumber = aDecoder.decodeObject(forKey: Keys.contactNumber.rawValue) as? String
        super.init()
    }
}
