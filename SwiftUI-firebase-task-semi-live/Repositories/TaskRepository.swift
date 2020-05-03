//
//  TaskRepository.swift
//  SwiftUI-firebase-task-semi-live
//
//  Created by sun on 3/5/2563 BE.
//  Copyright © 2563 sun. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("task")
        .order(by: "createdTime")
            .addSnapshotListener { (querySnapshort, err) in
            if let querySnapshort = querySnapshort {
                self.tasks = querySnapshort.documents.compactMap { document in
                    do {
                        return try document.data(as: Task.self) // codable
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    func addTask(task: Task) {
        do {
            let _ = try db.collection("task").addDocument(from: task)
        } catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateTask(task: Task) {
        if let taskID = task.id {
            do {
               let _ = try db.collection("task").document(taskID).setData(from: task)
            } catch {
                fatalError("Unable to update data task: \(error.localizedDescription)")
            }
        }
    }
}
