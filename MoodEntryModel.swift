//
//  MoodEntryModel.swift
//  moodTrack
//
//  Created by Erick Veil on 9/21/24.
//

import Foundation

class MoodEntryModel {
    private var repository = MoodEntryRepository()
    private(set) var moodEntries: [MoodEntry] = []
    
    func addMoodEntry(moodValue: Int) {
        let currentDate = Date()
        repository.createMoodEntry(moodValue: moodValue, date: currentDate)
        reloadEntries()
    }
    
    func reloadEntries() {
        moodEntries = repository.fetchAllMoodEntries()
    }
    
    func deleteMoodEntry(entry: MoodEntry) {
        repository.deleteMoodEntry(entry: entry)
        reloadEntries()
    }
    
    // Add other CRUD as needed.
    
}
