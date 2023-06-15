//
//  ToDoTask.swift
//  WT-Todo
//
//  Created by Lonnie Gerol on 6/14/23.
//

import Foundation

enum TaskPriority {
    case high, medium, low
}

struct ToDoTask: Identifiable {
    var title: String
    var priority: TaskPriority
    var dueDate: Date
    var id = UUID()
}
