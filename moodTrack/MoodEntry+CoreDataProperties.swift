//
//  MoodEntry+CoreDataProperties.swift
//  moodTrack
//
//  Created by Erick Veil on 9/20/24.
//
//

import Foundation
import CoreData


extension MoodEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoodEntry> {
        return NSFetchRequest<MoodEntry>(entityName: "MoodEntry")
    }

    @NSManaged public var date: Date?
    @NSManaged public var moodValue: Int16

}

extension MoodEntry : Identifiable {

}
