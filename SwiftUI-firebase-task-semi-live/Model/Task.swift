//
//  Task.swift
//  SwiftUI-firebase-task-semi-live
//
//  Created by sun on 27/4/2563 BE.
//  Copyright © 2563 sun. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG
    let testDataTasks = [
        Task(title: "Implement the UI", completed: true),
        Task(title: "Connect to Firebase", completed: false),
        Task(title: "?????", completed: false),
        Task(title: "Profit!!", completed: false)
    ]
#endif
