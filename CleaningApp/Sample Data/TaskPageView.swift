//
//  ContentView.swift
//  ClassPlanner
//
//  Created by Justin Wong on 2/23/24.
//

import SwiftUI

struct TaskPageView: View {
    @State private var dbScheduleManager = DBScheduleManager()
    @State private var currentTackIndex: Int = 0
    @State private var isPresentingAddClassSheet = false
    @State private var isPresentingThemeColorSheet = false
    @State private var isInEditMode = false
    
    private var currentYearString: String {
        String(dbScheduleManager.sortedTaskPlans[currentTackIndex].day)
    }
    
    private var currentYear: Int {
        dbScheduleManager.sortedTaskPlans[currentTackIndex].day
    }
    
    private var currentPlan: DBTaskPlan {
        dbScheduleManager.sortedTaskPlans[currentTackIndex]
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Text("You have " + "3" + " tasks today")
                    .font(.title3).fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .foregroundColor(Color(hex: "528ACD"))
                
                Spacer()
                TaskListView(yearPlan: currentPlan, isInEditMode: isInEditMode)
                    .environment(dbScheduleManager)
                
                
                
            }
            .navigationTitle(Text(Date.now, format: .dateTime.day().month().year()))
                 .foregroundColor(Color(hex: "FFFDFD"))
            
            //If wanting to incorporate a toolbar
            /*.toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        isPresentingAddClassSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                            .bold()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: {
                        withAnimation {
                            isInEditMode.toggle()
                        }
                    }) {
                        Text(isInEditMode ? "Done" : "Edit")
                            .bold()
                    }
                    Button(action: {
                        isPresentingThemeColorSheet.toggle()
                    }) {
                        Circle()
                            .fill(dbScheduleManager.themeColor.opacity(0.3))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Circle()
                                    .fill(dbScheduleManager.themeColor)
                                    .frame(width: 30, height: 30)
                            )
                    }
                }
            }*/
            .tint(dbScheduleManager.themeColor)
            .background(Color(hex: "B1CEAA").edgesIgnoringSafeArea(.all))
            
            
        }
        
    }
    
    
}


#Preview {
    TaskPageView()
}
