//
//  TaskCreateView.swift
//  WT-Todo
//
//  Created by Lonnie Gerol on 6/14/23.
//

import SwiftUI

struct TaskCreateView: View {
    @State
    private var taskTitle = ""
    
    @State
    private var selectedPriority = TaskPriority.low.rawValue
    
    @State
    private var dueDate = Date()
    
    var shouldEnableCreate: Bool {
        return taskTitle.isEmpty
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $taskTitle)
                        .accessibilityIdentifier("create_task.title.label")
                    Picker("Priority", selection: $selectedPriority) {
                        ForEach(TaskPriority.allCases) { priority in
                            Text(priority.rawValue)
                                .id(priority.rawValue)
                        }
                    }
                    DatePicker("Due Date", selection: $dueDate)
                }
                
                Section {
                    Button(action: {
                        print("ran123")
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Create")
                            Spacer()
                        }
                    })
                    .disabled(shouldEnableCreate)
                    .accessibilityIdentifier("create_task.create.button")
                }
            }
            .navigationTitle("Create Task")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TaskCreateView()
}
