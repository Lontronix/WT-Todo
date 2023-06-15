//
//  ToDoTask.swift
//  WT-Todo
//
//  Created by Lonnie Gerol on 6/14/23.
//

import Foundation

enum TaskPriority: String, CaseIterable, Identifiable {
    
    var id: String {
        return self.rawValue
    }
    
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

struct ToDoTask: Identifiable {
    var title: String
    var priority: TaskPriority
    var dueDate: Date
    var id = UUID()
}
