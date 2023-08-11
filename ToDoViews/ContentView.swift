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
    var body: some View {
        TabView {
            MainToDosView(toDoManager: todoManager)
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle.fill")
                }
            
            HowManyToDosLeftView(toDosManager: todoManager)
                .tabItem {
                    Label("To Dos Completed", systemImage: "number.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
