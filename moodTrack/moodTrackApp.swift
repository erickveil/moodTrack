//
//  moodTrackApp.swift
//  moodTrack
//
//  Created by Erick Veil on 9/20/24.
//

import SwiftUI

@main
struct moodTrackApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
