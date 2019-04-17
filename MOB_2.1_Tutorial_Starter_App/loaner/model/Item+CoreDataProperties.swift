//
//  Item+CoreDataProperties.swift
//  loaner
//
//  Created by Jackson Ho on 4/16/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit.UIImage

extension Item {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var notes: String
    @NSManaged public var loanee: Loanee
    @NSManaged public var itemTitle: String
    @NSManaged public var itemImage: UIImage

}
