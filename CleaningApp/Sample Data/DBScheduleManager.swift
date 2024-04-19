//
//  DBScheduleManager.swift
//  CleaningApp
//
//  Adapted 4/15/24 from ClassPlanner (Created by Justin Wong on 2/23/24).
//
import Foundation
import SwiftUI

//TODO: - 4B. Implement CPScheduleManager
@Observable class DBScheduleManager: Identifiable {
    var taskPlans: [DBTaskPlan] = CPSampleData.taskPlans
    
    var themeColor: Color = Color.orange
    
    var allClasses: [CTask] {
        var temp = [CTask]()
        
        for day in taskPlans {
            for t in day.Tasks {
                temp.append(t)
            }
        }
        
        return temp
    }
    
    var sortedTaskPlans: [DBTaskPlan] {
        taskPlans.sorted(by: {$1.day > $0.day})
    }
    
    
    
    
}


