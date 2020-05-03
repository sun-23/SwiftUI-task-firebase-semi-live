//
//  TaskCellViewModel.swift
//  SwiftUI-firebase-task-semi-live
//
//  Created by sun on 27/4/2563 BE.
//  Copyright © 2563 sun. All rights reserved.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var task: Task
    
    var id: String = ""
    @Published var completionStateIconName = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task.map { task in
            task.completed ? "chackmark.circle.fill" : "circle"
        }
        .assign(to: \.completionStateIconName , on: self) // store task.completed to completionStateIconName
        .store(in: &cancellables)
        
        $task.compactMap { task in
            task.id
        }
        .assign(to: \.id , on: self)
        .store(in: &cancellables)
    }
}
