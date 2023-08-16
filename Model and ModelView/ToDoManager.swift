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
    
    @Published var searchTerm = "" // What they input in the search bar of our MainToDoView
    
    var ToDosFiltered: Binding<[ToDo]> {
        Binding (
            get: {
                if self.searchTerm == "" { return self.todos }
                return self.todos.filter {
                    $0.title.lowercased().contains(self.searchTerm.lowercased())
                }
            },
            set: {
                self.todos = $0
            }
        )
    }
    
    func loadSampleData() {
        todos = ToDo.sampleToDos
    }
    
    var numToDosLeft: Int {
        todos.filter{!$0.isCompleted}.count
    }
    var numToDosCompleted: Int {
        todos.filter {$0.isCompleted}.count
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
