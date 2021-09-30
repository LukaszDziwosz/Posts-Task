//
//  Posts_TaskApp.swift
//  Posts_Task
//
//  Created by Lukasz Dziwosz on 30/09/2021.
//

import SwiftUI

@main
struct Posts_TaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PostsListView()
        }
    }
}
