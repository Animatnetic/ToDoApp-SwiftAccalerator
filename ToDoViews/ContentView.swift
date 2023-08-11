//
//  ContentView.swift
//  ToDoApp
//
//  Created by Faris Ansari on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var todoManager = TodoManager()
//    @State private var tasks: [ToDo] = [
//        ToDo(title: "Feed the cats", isCompleted: true),
//        ToDo(title: "Feed the horses", subtitle: "twice a day"),
//        ToDo(title: "Finish Swift Accelerator Programme Class"),
//        ToDo(title: "Finish the tasks")
//    ]
    
    @State private var showAddSheet = false
    @State private var showConfirmAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List($todoManager.todos, editActions: [.all]) { $task in
                            ToDoView(toDo: $task)
                        }
                        .navigationTitle("To Do:")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                EditButton()
                            }
                            
                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                
                                #if DEBUG
                                Button {
                                    showConfirmAlert = true
                                } label: {
                                    Image(systemName: "list.bullet.clipboard.fill")
                                }
                                #endif
                                
                                Button {
                                    showAddSheet = true
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
            .sheet(isPresented: $showAddSheet) {
                NewToDoView(toDosArray: $todoManager.todos)
            }
            .alert("Load sample data?", isPresented: $showConfirmAlert) {
                Button("Load and Replace", role: .destructive) {
                    todoManager.loadSampleData()
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
