//
//  TaskListView.swift
//  ClassPlannerFinished
//
//  Created by Justin Wong on 2/23/24.
//

import SwiftUI

struct TaskListView: View {
    var yearPlan: DBTaskPlan
    var isInEditMode: Bool
    
    
    var body: some View {
        VStack {
            
            SemesterDisclosureGroup(Tasks: yearPlan.Tasks, isInEditMode: isInEditMode)
            Spacer()
        }
    }
}

//MARK: - SemesterDisclosureGroup
struct SemesterDisclosureGroup: View {
    @State private var isExpanded = true
    var Tasks: [CTask]
    var isInEditMode: Bool
    @State private var select = 0
    @State private var tog = false
    
    @Environment(DBScheduleManager.self) private var cpm
    
    var body: some View {
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                if !Tasks.isEmpty {
                    VStack(spacing: 20) {
                        ForEach(Tasks, id: \.id) { CTask in
                            ClassRowView(tasks: Tasks, CTask: CTask, isInEditMode: isInEditMode, selected: $select, barToggled: $tog)
                        }
                        //Spacer()
                        progressBar
                        //Spacer()
                        streak
                        
                    }
                } else {
                    Text("No Tasks Available")
                        .bold()
                        .foregroundStyle(.secondary)
                }
            },
            label: {
                Text("Today's Tasks")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
            }
            
        )
    }
    
    private var progressBar: some View {
        VStack(alignment: .leading) {
            Text("Today's Progress")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundStyle(cpm.themeColor)
            ZStack (alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 10.0)
                    .strokeBorder()
                    .frame(width: 300, height: 25)
                    .foregroundColor(.orange)
                RoundedRectangle(cornerRadius: 10.0)
                    .frame(width: (CGFloat(select)/3) * 300, height: 25, alignment: .leading)
                    .animation(.default, value: tog)
                    .foregroundColor(.blue)
            }
        }

    }
    
    private var streak: some View {
        VStack(alignment: .leading) {
            Text("Streak 🎉")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundStyle(cpm.themeColor)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
            HStack() {
                VStack{
                    Text("24")
                    Text("Days")
                }
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                
                Spacer()
                
                
                VStack{
                    Text("You're")
                    Text("on")
                    Text("a roll!🧻")
                }
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .foregroundStyle(cpm.themeColor)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 40))
            }
        }

    }
}

//MARK: - ClassRowView
struct ClassRowView: View {
    var tasks: [CTask]
    var CTask: CTask
    var isInEditMode: Bool
    
    @Binding var selected: Int
    @Binding var barToggled: Bool

    @State private var showClassDetailView = false
    @Environment(DBScheduleManager.self) private var cpm
    
    var body: some View {
        HStack () {
            if isInEditMode {
                /*Button(action: {
                    /*if let removeIndex = tasks.firstIndex(where: { $0.id == CTask.id }) {
                        tasks.remove(at: removeIndex)
                    }*/
                    Text("here")
                    
                }) {
                    Image(systemName: "trash")
                        .font(.system(size: 20))
                        .foregroundStyle(.red)
                }*/
            } else {
                Button(action: {
                    withAnimation {
                        CTask.alreadyDone.toggle()
                    }
                    
                    if (CTask.alreadyDone) {
                        selected = selected + 1
                        barToggled.toggle()
                    } else {
                        selected = selected - 1
                        barToggled.toggle()
                    }
                    
                    
                }) {
                    Image(systemName: CTask.alreadyDone ? "checkmark.circle.fill" : "circle")
                        .font(.system(size: 20))
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                }
            }
            
            VStack(alignment: .leading) {
                Text(CTask.name)
                    .font(.title2).fontWeight(.bold)
                Text(CTask.domain)
                    .font(.title3).fontWeight(.bold)
                //TODO: - THEME COLOR SHOULD BE HERE
                    .foregroundStyle(cpm.themeColor)
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            Spacer()
            
            
        }
        .onTapGesture {
            withAnimation {
                showClassDetailView.toggle()
            }
        }
        
        
    }
}


#Preview {
    Group {
        TaskListView(yearPlan: CPSampleData.yearPlan, isInEditMode: false)
    }
    .padding()
    .environment(DBScheduleManager())
}

