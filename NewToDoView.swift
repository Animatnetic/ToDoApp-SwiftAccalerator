//
//  NewToDoView.swift
//  ToDoApp
//
//  Created by Faris Ansari on 01/08/2023.
//

import SwiftUI

struct NewToDoView: View {
    var showAddSheet = false
    
    @State private var toDoTitle = ""
    @State private var inputtedSubtitle = ""
    
    var body: some View {
        ZStack {
            VStack {
                Form {
                    Section("Info") {
                        TextField("Title", text: $toDoTitle)
                        TextField("Subtitle", text: $inputtedSubtitle)
                    }
                    
                    Section("Actions") {
                        Button("Save") {
                            
                        }
                        
                        Button("Cancel", role: .destructive) {
                            
                        }
                    }
                }
            }
        }
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(showAddSheet: true)
    }
}
