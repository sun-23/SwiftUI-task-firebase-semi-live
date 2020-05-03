//
//  TaskListViewModel.swift
//  SwiftUI-firebase-task-semi-live
//
//  Created by sun on 27/4/2563 BE.
//  Copyright © 2563 sun. All rights reserved.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskRepository = TaskRepository()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        taskRepository.$tasks.map { tasks in
            tasks.map { task in
                TaskCellViewModel(task: task)
            }
        }
        .assign(to: \.taskCellViewModels , on: self)
        .store(in: &cancellables)
    }
    
    func addTask(task: Task) {
        self.taskRepository.addTask(task: task)
    }
}
