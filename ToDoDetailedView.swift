//
//  ToDoDetailedView.swift
//  ToDoApp
//
//  Created by Faris Ansari on 31/07/2023.
//

import SwiftUI

struct ToDoDetailedView: View {
    @Binding var todo: ToDo
    
    var body: some View {
        Form {
            TextField("Titile", text: $todo.title)
                .font(.title)
                .fontWeight(.heavy)
            
            TextField("Subtitile", text: $todo.subtitle)
                .font(.title2)
            Toggle("Is Completed?", isOn: $todo.isCompleted)
        }
    }
}

struct ToDoDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDetailedView(todo: .constant(ToDo(title: "Feed the cat", subtitle: "Hello", isCompleted: true)))
    }
}
