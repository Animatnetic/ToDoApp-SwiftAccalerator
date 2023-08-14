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
            
            Picker("Priority:", selection: $todo.priority) {
                ForEach(EnumPriority.allCases) { eachCase in
                    Text(String(describing: eachCase))
                }
            }
            

            Section("Date: ") {
                if !(todo.dueDate == nil){
                    Toggle("Include Due Date:", isOn: $includeDate)
                        .onAppear {
                            includeDate = true // Not use toggle because there can be inconsistencies between every rendering
                        }
                        .onChange(of: includeDate) { newValue in
                            if newValue == false {
                                todo.dueDate = nil
                            }
                        }
                    
                    // Simply triggers conditional rendering but constant `due date` is actually never used.
                    DatePicker("Due Date:", selection: $todo.dueDate ?? Date.now, displayedComponents: [.date]) // "Date.now" is actually not expected to ever come up but it is just used for initialization due to how strict are data types in swift
                        .datePickerStyle(.compact)
                } else {
                    Toggle("Include Due Date:", isOn: $includeDate)
                        .onChange(of: includeDate) { newValue in
                            if newValue == true {
                                todo.dueDate = Date.now
                            }
                        }
                }
            }
        }
    }
}


struct ToDoDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDetailedView(todo: .constant(ToDo(title: "Feed the cats", subtitle: "They are hungwy", isCompleted: false, dueDate: Date.now))) // Because this is a constant, during testin of only this view, it actually will not be visible which is why I need to test it from ContentView
    }
}
