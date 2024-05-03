import SwiftUI

struct AddTaskButton: View {
    @State private var isPresented: Bool = false
    @State private var taskName: String = ""
    @Binding var tasks: [String]
    var date: String
    var dateColor: String
    var buttonBackgroundColor: String
    var fontColor: String
    var body: some View {
        HStack {
            Text(date).foregroundStyle(Color(hex: dateColor))
                Spacer()
            Button("+ Add Task") {
                isPresented.toggle()
            }
            .padding(5)
            .foregroundStyle(Color(hex: fontColor))
            .background(Color(hex: buttonBackgroundColor))
            .cornerRadius(10)
            .alert("Enter your task", isPresented: $isPresented) {
                TextField("Right here", text: $taskName)
                Button("Add", action: submit)
            }
        }
        
    }

    func submit() {
        tasks.append(taskName)
    }
}

struct ScheduleTaskView: View {
    @Binding var tasks: [String]
    var body: some View {
        VStack {
            AddTaskButton(tasks: $tasks, date: "Sunday", dateColor: "CD5252", buttonBackgroundColor: "D08C7D", fontColor: "F1DAD4").padding()
        }
        .font(.title)
        .bold()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
