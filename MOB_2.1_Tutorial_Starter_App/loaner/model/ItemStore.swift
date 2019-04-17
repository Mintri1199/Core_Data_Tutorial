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
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    enum FetchItemsResult {
        case success([Item])
        case failure(Error)
    }
    
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
    
    func fetchPersistedData(completion: @escaping (FetchItemsResult) -> Void) {
        
        let fetchRequest: NSFetchRequest<Item> = Item.createFetchRequest()
        let viewContext = persistentContainer.viewContext
        
        do {
            let allItems = try viewContext.fetch(fetchRequest)
            completion(.success(allItems))
        } catch {
            completion(.failure(error))
        }
    }
}
