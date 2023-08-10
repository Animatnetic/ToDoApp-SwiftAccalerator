//
//  ToDoManager.swift
//  ToDoApp
//
//  Created by Faris Ansari on 07/08/2023.
//

import Foundation
import SwiftUI

class TodoManager: ObservableObject {
    @Published var todos: [ToDo] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "<#item#>s.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodeTodos = try? propertyListEncoder.encode(todos)
        try? encodeTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let todosDecoded = try? propertyListDecoder.decode([ToDo].self, from: retrievedTodoData) {
            todos = todosDecoded
        }
    }
}