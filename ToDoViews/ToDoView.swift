//
//  ToDoView.swift
//  ToDoApp
//
//  Created by Faris Ansari on 07/08/2023.
//

import SwiftUI

struct ToDoView: View {
    @Binding var toDo: ToDo
    
    var body: some View {
        NavigationLink {
            ToDoDetailedView(todo: $toDo)
        } label: {
            HStack {
                
                Image(systemName: toDo.isCompleted ? "checkmark.circle.fill" : "circle")
                
                VStack(alignment: .leading) {
                    Text("\(toDo.title)")
                    
                    if toDo.subtitle != "" {
                        Text("\(toDo.subtitle)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    if let dueDate = toDo.dueDate {
                        Text("Due: \(dueDate.formatted(.dateTime.day().month().year()))")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .strikethrough(toDo.isCompleted)
            }
            .onTapGesture {
                withAnimation {
                    toDo.isCompleted.toggle()
                }
            }
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView(toDo: .constant(ToDo(title: "Feed the cat", dueDate: Date())))
    }
}
