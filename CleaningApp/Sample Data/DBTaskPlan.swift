//
//  DBTaskPlan.swift
//  CleaningApp
//
//  Adapted 4/15/24 from ClassPlanner (Created by Justin Wong on 2/23/24)
//

import Foundation

@Observable class DBTaskPlan: Identifiable {
    var day: Int
    var Tasks: [CTask]
    
    init(day: Int, Tasks: [CTask]) {
        self.day = day
        self.Tasks = Tasks
    }
    
}

@Observable class CTask: Identifiable {
    var id = UUID()
    var name: String
    //var instructors: [String]
    var domain: String
    var alreadyDone: Bool
    
    /*var getInstructorsString: String {
        return instructors.map{String($0)}.joined(separator: ",")
    }*/
    
    init(id: UUID = UUID(), name: String, domain: String, alreadyDone: Bool) {
        self.id = id
        self.name = name
        //self.instructors = instructors
        self.domain = domain
        self.alreadyDone = alreadyDone
    }
}
