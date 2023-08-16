//
//  SwiftUIView.swift
//  ToDoApp
//
//  Created by Faris Ansari on 11/08/2023.
//

import SwiftUI

struct MainToDosView: View {
    @ObservedObject var toDoManager: TodoManager
    @State private var showAddSheet = false
    @State private var showConfirmAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    Section("Incomplete") {
                        List(toDoManager.inCompleteToDosFiltered, editActions: [.all]) { $task in
//                                if !task.isCompleted {
                                    ToDoView(toDo: $task)
                                        .listRowBackground(task.priority == .urgent ? Color.yellow : nil)
//                                }
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
                                    
                                    Menu {
                                        Text("Sort by...")
                                        Button("Priority", action: priorityOrder)
                                        Button("Title", action: alphabeticalOrder)
                                        Button("Due Date", action: dueDateOrder)
                                    } label: {
                                        Image(systemName: "ellipsis.circle")
                                    }
                                }
                        }
                    }
                    
                    Section("Complete") {
                        List(toDoManager.CompletedToDosFiltered, editActions: [.all]) { $task in
                                    ToDoView(toDo: $task)
                                        .listRowBackground(task.priority == .urgent ? Color.yellow : nil)
                            }
                    }
                }
            }
            .searchable(text: $toDoManager.searchTerm)
            .sheet(isPresented: $showAddSheet) {
                NewToDoView(toDosArray: $toDoManager.todos)
            }
            .alert("Load sample data?", isPresented: $showConfirmAlert) {
                Button("Load and Replace", role: .destructive) {
                    toDoManager.loadSampleData()
                }
            }
        }
    }
    
    
    func priorityOrder() {
        toDoManager.todos.sort { $0.priority > $1.priority }
    }
    
    
    func alphabeticalOrder() {
        toDoManager.todos.sort{ $0.title.lowercased() < $1.title.lowercased() }
    }
    
    
    func dueDateOrder() {
        toDoManager.todos.sort { $0.dueDate ?? Date.now > $1.dueDate ?? Date.now }
    }
}

struct MainToDosView_Previews: PreviewProvider {
    static var previews: some View {
        MainToDosView(toDoManager: TodoManager())
    }
}
