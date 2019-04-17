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
    
    func saveContext() {
        let viewContext = persistentContainer.viewContext
        
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolve error \(nserror)")
            }
            
        }
    }
    
    
    
}
