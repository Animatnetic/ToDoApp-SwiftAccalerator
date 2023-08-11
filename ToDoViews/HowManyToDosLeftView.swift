//
//  HowManyToDosLeftView.swift
//  ToDoApp
//
//  Created by Faris Ansari on 11/08/2023.
//

import SwiftUI

struct HowManyToDosLeftView: View {
    @ObservedObject var toDosManager: TodoManager
    @State private var toDosLeft = 0
    
    // No need to wrap these 2 vars with @State as they never get updated inside the struct view itself.
    // Also, since we do not update it from this view, it does not need @Bindable
    
    var body: some View {
        ZStack {
            VStack {
                Text("You have:")
                Text("\(toDosManager.numToDosLeft)")
                    .font(.system(size: 150))
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                Text(toDosManager.numToDosLeft == 1 ? "Todo Left" : "Todos Left")
                
                
                Text("You have: ")
                    .padding(.top, 40)
                HStack {
                    Text("You have completed ^[\(toDosManager.numToDosCompleted) todos](inflect: true). Goodjob")
                }
            }
        }
    }
}

struct HowManyToDosLeftView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyToDosLeftView(toDosManager: TodoManager())
    }
}
