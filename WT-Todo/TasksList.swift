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
            ToDoTask(title: "Remember the Milk", priority: .high, dueDate: .now, id: UUID()),
            ToDoTask(title: "Todoist", priority: .medium, dueDate: .now, id: UUID()),
            ToDoTask(title: "omnifocus", priority: .low, dueDate: .now, id: UUID())
        ]
        
        func delete(task: ToDoTask) {
            tasks.removeAll(where: {
                task.id == $0.id
            })
        }
    }
    
    @State var vm: ViewModel = ViewModel()
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.tasks) { task in
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
                            vm.delete(task: task)
                        }, label: {
                            Text("Complete!")
                                .padding()
                                .background(Color(uiColor: .systemGreen))
                        })
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
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("Todo It!")
        }
    }
}

#Preview {
    TasksList()
}
