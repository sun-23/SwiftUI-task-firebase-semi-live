//
//  Task.swift
//  SwiftUI-firebase-task-semi-live
//
//  Created by sun on 27/4/2563 BE.
//  Copyright © 2563 sun. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String? //DocumentID from firestore document
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
}

#if DEBUG
    let testDataTasks = [
        Task(title: "Implement the UI", completed: true),
        Task(title: "Connect to Firebase", completed: false),
        Task(title: "?????", completed: false),
        Task(title: "Profit!!", completed: false)
    ]
#endif
