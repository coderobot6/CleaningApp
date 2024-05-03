import SwiftUI

struct TaskView: View {
    @State private var tasks: [String] {
        didSet {
            UserDefaults.standard.set(tasks, forKey: "tasks")
        }
    }
    @State private var completedTasks = Set<String>()
    @State private var displayTask: Bool = false

    init() {
        let tasks = UserDefaults.standard.stringArray(forKey: "tasks") ?? ["Task 1", "Task 2", "Task 3"]
        _tasks = State(initialValue: tasks)
    }

    var body: some View {
        VStack {
            HStack {
            Text("Your schedule")
                .font(.title)
                .padding()
            }

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
            Button("Schedule Task") {
                self.displayTask.toggle()
            }.sheet(isPresented: $displayTask) {
                ScheduleTaskView(tasks: $tasks)
            }
        }
    }
}


#Preview {
    TaskView()
}
