//
//  TaskView.swift
//  CleaningApp
//
//  Created by Triet Tran on 4/9/24.
//

import SwiftUI

struct TaskView: View {
    @State private var tasks = ["Task 1", "Task 2", "Task 3"]
    @State private var completedTasks = Set<String>()

    var body: some View {
        VStack {
            Text("Your tasks")
                .font(.title)
                .padding()

            List {
                ForEach(tasks, id: \.self) { task in
                    HStack {
                        Text(task)
                        Spacer()
                        Button(action: {
                            if completedTasks.contains(task) {
                                completedTasks.remove(task)
                            } else {
                                completedTasks.insert(task)
                            }
                        }) {
                            Image(systemName: completedTasks.contains(task) ? "checkmark.circle.fill" : "circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    TaskView()
}
