//
//  ToDoStructure.swift
//  ToDoApp
//
//  Created by Faris Ansari on 31/07/2023.
//

import Foundation

struct ToDo: Identifiable, Codable { // Making it codable allows it to be encoded or decoded to external file encodings
    var id: UUID = UUID()
    
    var title: String
    var subtitle: String = ""
    
    var isCompleted: Bool = false
}
