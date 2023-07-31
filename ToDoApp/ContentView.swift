//
//  ContentView.swift
//  ToDoApp
//
//  Created by Faris Ansari on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [ToDo] = [
        ToDo(title: "Feed the cats", isCompleted: true),
        ToDo(title: "Feed the horses"),
        ToDo(title: "Finish Swift Accelerator Programme Class"),
        ToDo(title: "Finish the tasks")
    ]
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List(tasks) { task in
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            
                            Text("\(task.title)")
                        }
                        .strikethrough(task.isCompleted)
                        .onTapGesture {
//                            task.isCompleted = !task.isCompleted
                        }
                    }
                    .navigationTitle("To Do:")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
