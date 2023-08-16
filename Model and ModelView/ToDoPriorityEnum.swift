//
//  ToDoPriorityEnum.swift
//  ToDoApp
//
//  Created by Faris Ansari on 14/08/2023.
//

import Foundation

enum EnumPriority: CaseIterable, Identifiable, CustomStringConvertible, Codable, Comparable {
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
    
    private var sortOrder: Int {
        switch self {
        case .normal:
            return 0
            
        case .urgent:
            return 1
        }
    }
    
    
    static func ==(lhs: EnumPriority, rhs: EnumPriority) -> Bool {
        return lhs.sortOrder == rhs.sortOrder
    }
    
    static func <(lhs: EnumPriority, rhs: EnumPriority) -> Bool {
        return lhs.sortOrder < rhs.sortOrder
    }
    
}
