//
//  CoreDataStack.swift
//  Oct21_Final_Project
//
//  Created by user203897 on 10/21/21.
//

import Foundation
import CoreData
class CoreDataStack {
    static var shared = CoreDataStack()
    lazy var persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Error\(error)")}
         }
        return container
        
    }()
    
    func saveContext (){
        let context = persistentContainer.viewContext
        if context.hasChanges{
            do {
            try? context.save()}
            
            catch{
                let error = error as NSError?
                    fatalError("Error\(error)")
             }
        }
    }
}
