//
//  ToDoDetailedView.swift
//  ToDoApp
//
//  Created by Faris Ansari on 31/07/2023.
//

import SwiftUI

struct ToDoDetailedView: View {
    @Binding var todo: ToDo
    @State private var includeDate = false
    
    var body: some View {
        Form {
            TextField("Titile", text: $todo.title)
                .font(.title)
                .fontWeight(.heavy)
            
            TextField("Subtitile", text: $todo.subtitle)
                .font(.title2)
            Toggle("Is Completed?", isOn: $todo.isCompleted)
            

            Section("Date: ") {
                if !(todo.dueDate == nil) || includeDate {
                    Toggle("Include Due Date:", isOn: $includeDate)
                    
                    // Simply triggers conditional rendering but constant `due date` is actually never used.
                    DatePicker("Due Date:", selection: $todo.dueDate ?? Date.now, displayedComponents: [.date]) // "Date.now" is actually not expected to ever come up but it is just used for initialization due to how strict are data types in swift
                        .datePickerStyle(.compact)
                } else {
                    Toggle("Include Due Date:", isOn: $includeDate)
                }
            }
        }
    }
}


struct ToDoDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDetailedView(todo: .constant(ToDo(title: "Feed the cats", subtitle: "They are hungwy", isCompleted: false, dueDate: nil)))
    }
}
