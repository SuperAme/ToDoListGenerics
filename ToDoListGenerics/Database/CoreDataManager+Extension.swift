//
//  CoreDataManager+Extension.swift
//  ToDoListGenerics
//
//  Created by IDS Comercial on 08/07/21.
//

import Foundation
import CoreData

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
