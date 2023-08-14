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
                    List($toDoManager.todos, editActions: [.all]) { $task in
                            if !task.isCompleted {
                                ToDoView(toDo: $task)
                                    .listRowBackground(task.priority == .urgent ? Color.yellow : nil)
                            }
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
                NewToDoView(toDosArray: $toDoManager.todos)
            }
            .alert("Load sample data?", isPresented: $showConfirmAlert) {
                Button("Load and Replace", role: .destructive) {
                    toDoManager.loadSampleData()
                }
            }
        }
    }
}

struct MainToDosView_Previews: PreviewProvider {
    static var previews: some View {
        MainToDosView(toDoManager: TodoManager())
    }
}
