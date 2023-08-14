//
//  ToDoPriorityEnum.swift
//  ToDoApp
//
//  Created by Faris Ansari on 14/08/2023.
//

import Foundation

enum EnumPriority: CaseIterable, Identifiable, CustomStringConvertible, Codable {
    case normal
    case urgent
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case.normal:
            return "Normal"
        case.urgent:
            return "Urgent"
        }
    }
}
