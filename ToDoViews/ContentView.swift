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
        ToDo(title: "Feed the horses", subtitle: "twice a day"),
        ToDo(title: "Finish Swift Accelerator Programme Class"),
        ToDo(title: "Finish the tasks")
    ]
    
    @State private var showAddSheet = false
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {   
                    List($tasks, editActions: [.all]) { $task in
                        NavigationLink {
                            ToDoDetailedView(todo: $task)
                        } label: {
                            HStack {
                                
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                
                                VStack(alignment: .leading) {
                                    Text("\(task.title)")
                                    
                                    if task.subtitle != "" {
                                        Text("\(task.subtitle)")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .strikethrough(task.isCompleted)
                            }
                            .onTapGesture {
                                withAnimation {
                                    task.isCompleted.toggle()
                                }
                            }
                        }
                    }
                    .navigationTitle("To Do:")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            EditButton()
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showAddSheet = true
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }.sheet(isPresented: $showAddSheet) {
                NewToDoView(toDosArray: $tasks)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}