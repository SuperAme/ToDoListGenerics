//
//  CoreDataManager.swift
//  ToDoListGenerics
//
//  Created by IDS Comercial on 07/07/21.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoListGenerics")
        container.loadPersistentStores { (_ , error) in
            if let error = error as NSError? {
                fatalError("Unresolved Message \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    private init() {
        managedObjectContext = self.persistentContainer.viewContext
    }
    
    private func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let err {
                let error = err as NSError
                fatalError("Unresolved Message \(error), \(error.userInfo)")
            }
        }
    }
}

extension CoreDataManager {
    func saveFolder(name: String) {
        let folder = Folder(context: managedObjectContext)
        folder.title = name
        saveContext()
    }
    
    func saveTodo(folder: String, todoItem: String) {
        let todo = Todo(context: managedObjectContext)
        todo.folder = folder
        todo.title = todoItem
        saveContext()
    }
}
