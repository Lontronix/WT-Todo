//
//  ContentView.swift
//  WT-Todo
//
//  Created by Lonnie Gerol on 6/14/23.
//

import SwiftUI
import Observation

struct TasksList: View {
    
    @Observable
    class ViewModel {
        var tasks: [ToDoTask] = [
            ToDoTask(
                title: "Remember the Milk",
                priority: .high,
                dueDate: .now,
                id: UUID(uuidString: "F20DFA2A-9116-44E4-A326-06047319F900")!
            ),
            ToDoTask(
                title: "Todoist",
                priority: .medium,
                dueDate: .now,
                id: UUID(uuidString: "C50516AF-63FB-4D91-BF22-270A7BF65079")!
            ),
            ToDoTask(
                title: "omnifocus",
                priority: .low,
                dueDate: .now,
                id: UUID(uuidString: "476751FD-7BCF-4C72-98E5-3E0176762296")!
            )
        ]
        
        func delete(task: ToDoTask) {
            tasks.removeAll(where: {
                task.id == $0.id
            })
        }
    }
    
    @State private var vm: ViewModel = ViewModel()
    @State private var showCreateTaskModal = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.tasks) { task in
                    TodoCell(task: task) {
                        vm.delete(task: task)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showCreateTaskModal.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.red)
                    })
                    .accessibilityIdentifier("tasklist.create.task.button")
                }
            }
            .navigationTitle("Todo It!")
            .sheet(isPresented: $showCreateTaskModal) {
                TaskCreateView()
            }
        }
    }
}

struct TodoCell: View {
    
    var task: ToDoTask
    
    var onDelete: (() -> Void)?
    
    var body: some View {
        HStack {
            
            if task.priority == .high {
                Rectangle()
                    .fill(.red)
                    .frame(width: 10)
            } else if task.priority == .medium {
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 10)
            } else {
                Rectangle()
                    .fill(.green)
                    .frame(width: 10)
            }
            
            VStack(alignment: .leading) {
                Text(task.title)
                Text(task.dueDate.formatted())
            }
            
            Spacer()
            Button(action: {
                onDelete?()
            }, label: {
                Text("Complete!")
                    .padding()
                    .background(Color(uiColor: .systemGreen))
            })
            .accessibilityIdentifier("tasklist.complete.button-\(task.id.uuidString)")
            .tint(Color.white)
            .clipShape(
                .rect(
                    cornerRadii:
                        RectangleCornerRadii(
                            topLeading: 10,
                            bottomLeading: 10,
                            bottomTrailing: 10,
                            topTrailing: 10)
                )
            )
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("tasklist.todo.cell")
    }
}

#Preview {
    TasksList()
}
