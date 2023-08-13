//
//  NewToDoView.swift
//  ToDoApp
//
//  Created by Faris Ansari on 01/08/2023.
//

import SwiftUI

struct NewToDoView: View {
    @Binding var toDosArray: [ToDo]
    
    @State private var toDoTitle = ""
    @State private var inputtedSubtitle = ""
    @State private var dueDate = Date()
    @State private var isDueDate = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                Form {
                    Section("Info") {
                        TextField("Title", text: $toDoTitle)
                            .fontWeight(.heavy)
                        TextField("Subtitle", text: $inputtedSubtitle)
                    }
                    
                    Section("Date") {
                        Toggle(isOn: $isDueDate) {
                            Text("Enable Due date")
                        }
                        
                        if isDueDate {
                            DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date])
                                .datePickerStyle(.compact)
                        }
                    }
                    
                    Section("Actions") {
                        Button("Save") {
                            let newTodo = ToDo(title: toDoTitle, subtitle: inputtedSubtitle, dueDate: isDueDate ? dueDate : nil)
                            
                            if newTodo.title != "" {
                                toDosArray.append(newTodo)
                            }
                        
                            dismiss()
                        }
                        
                        Button("Cancel", role: .destructive) {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}


struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(toDosArray: .constant([]))
    }
}
