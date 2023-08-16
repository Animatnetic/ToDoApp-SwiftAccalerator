//
//  ToDoStructure+Sample.swift
//  ToDoApp
//
//  Created by Faris Ansari on 10/08/2023.
//

import Foundation

extension ToDo {
    static let sampleToDos = [
        ToDo(title: "Feed the cats", isCompleted: false),
        ToDo(title: "Buy cat food", isCompleted: false, priority: .urgent),
        ToDo(title: "ABC", isCompleted: false, priority: .urgent),
        ToDo(title: "bro why not working", isCompleted: true, priority: .normal),
        ToDo(title: "Sell off the car", isCompleted: true, priority: .urgent),
        ToDo(title: "HELP ME", isCompleted: false, priority: .urgent)
    ]
}
