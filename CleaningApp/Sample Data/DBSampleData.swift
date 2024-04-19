//
//  DBSampleData.swift
//  CleaningApp
//
//  Adapted 4/15/24 from ClassPlanner (Created by Justin Wong on 2/23/24).
//

import Foundation

//MARK: - DO NOT MODIFY ------>
struct CPSampleData {
    static let taskPlans = [
        DBTaskPlan(day: 24, Tasks: [
            //CPSemester(type: .spring, classes: [
                CTask(name: "Clean Sink 🚰", domain: "Bathroom", alreadyDone: false),
                CTask(name: "Clean Toilet 🚽", domain: "Bathroom", alreadyDone: false),
                CTask(name: "Clean Shower 🚿", domain: "Bathroom", alreadyDone: false)
            //])
        ])]
        /*, CPYearPlan(day: 25, Tasks: [
            //CPSemester(type: .fall, classes: [
                CTask(name: "CS61A", domain: "Computer Science", alreadyDone: false),
                CTask(name: "EECS16A", domain: "Electrical Engineering", alreadyDone: false),
                CTask(name: "MATH53", domain: "Mathematics", alreadyDone: false),
            //]),
            //CPSemester(type: .spring, classes: [
                CTask(name: "EECS16B", domain: "Computer Science", alreadyDone: false),
                CTask(name: "CS61B", domain: "Computer Science", alreadyDone: false),
                CTask(name: "Physics 7A", domain: "Physics", alreadyDone: false)
            //])
        ])
    ]*/
    
    static let yearPlan = DBTaskPlan(day: 26, Tasks: [
        //CPSemester(type: .spring, classes: [
        CTask(name: "Clean Sink 🚰", domain: "Bathroom", alreadyDone: false),
        CTask(name: "Clean Toilet 🚽", domain: "Bathroom", alreadyDone: false),
        CTask(name: "Clean Shower 🚿", domain: "Bathroom", alreadyDone: false)
        //])
    ])
}
//MARK: <------ DO NOT MODIFY

