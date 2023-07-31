//
//  ToDoStructure.swift
//  ToDoApp
//
//  Created by Faris Ansari on 31/07/2023.
//

import Foundation

struct ToDo: Identifiable {
    var id: UUID = UUID()
    
    var title: String
    var isCompleted: Bool
}
