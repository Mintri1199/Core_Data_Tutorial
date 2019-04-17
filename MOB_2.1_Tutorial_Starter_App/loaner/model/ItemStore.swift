//
//  ItemStore.swift
//  loaner
//
//  Created by Jackson Ho on 4/16/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//

import UIKit
import CoreData

class ItemStore: NSObject {
    
    let persistentContainer: NSPersistentContainer  = {
        // Create a NSPersistentContainer object
        let container = NSPersistentContainer(name: "LoanedItems")
        
        // Load the saved datatbase if it exists, creates it if it does not, and returns an error under failure conditions.
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        }
        return container
    }()
    
    
    
    
    
}
