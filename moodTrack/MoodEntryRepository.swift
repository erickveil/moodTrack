//
//  MoodEntryRepository.swift
//  moodTrack
//
//  Created by Erick Veil on 9/21/24.
//

import Foundation
import CoreData
import UIKit

class MoodEntryRepository {
    private let context: NSManagedObjectContext
    
    /**
     Initializes the repository with a connection to the app's data source.
     - The `context` lets us interact with the app's data. Like a workspace that lets us do the CRUD work.
     - By default, it uses the "workspace" (context) from the app's `AppDelegate`, which is what sets up
        the app's Core Data when the app launches.
     */
    init (context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
    //init(context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext) {
        self.context = context
    }
    
    func createMoodEntry(moodValue: Int, date: Date) {
        let newEntry = MoodEntry(context: context)
        newEntry.moodValue = Int16(moodValue)
        newEntry.date = date
        saveContext()
    }
    
    func fetchAllMoodEntries() -> [MoodEntry] {
        let fetchRequest: NSFetchRequest<MoodEntry> = MoodEntry.fetchRequest()
        do {
            let moodEntries = try context.fetch(fetchRequest)
            return moodEntries
        } catch {
            print("Error fetching mood entries: \(error)")
            return []
        }
    }
    
    func updateMoodEntry(entry: MoodEntry, newMoodValue: Int, newDate: Date) {
        entry.moodValue = Int16(newMoodValue)
        entry.date = newDate
        saveContext()
    }
    
    func deleteMoodEntry(entry: MoodEntry) {
        context.delete(entry)
        saveContext()
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
}

