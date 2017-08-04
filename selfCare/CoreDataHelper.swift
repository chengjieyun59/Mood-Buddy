//
//  CoreDataHelper.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class CoreDataHelper{
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    ///////////////////////////////////
    // static methods for Journals: //
    /////////////////////////////////
    static func newJournal() -> Journal {
        let journal = NSEntityDescription.insertNewObject(forEntityName: "Journal", into: managedContext) as! Journal
        return journal
    }
    
    static func saveJournal(){
        do {
            try managedContext.save()
        } catch let error as NSError{
            print("Saving failed \(error)")
        }
    }
    
    static func delete(journal: Journal){
        managedContext.delete(journal)
        saveJournal()
    }
    
    static func retrieveJournals() -> [Journal]{
        let fetchRequest = NSFetchRequest<Journal>(entityName: "Journal")
        do{
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError{
            print("Fetching failed \(error)")
        }
        return []
    }
    
    /*
     ////////////////////////////////////
     // static methods for Exercises: //
     //////////////////////////////////
    static func newExercise() -> Exercise {
        let exercise = NSEntityDescription.insertNewObject(forEntityName: "Exercise", into: managedContext) as! Exercise
        return exercise
    }
    
    static func saveExercise(){
        do {
            try managedContext.save()
        } catch let error as NSError{
            print("Saving failed \(error)")
        }
    }
    
    static func delete(exercise: Exercise){
        managedContext.delete(exercise)
        saveExercise()
    }
    */
    
    ///////////////////////////////////////
    // static methods for SelfHelpDays: //
    /////////////////////////////////////
    static func newSelfHelpDay() -> SelfHelpDay {
        let selfHelpDay = NSEntityDescription.insertNewObject(forEntityName: "SelfHelpDay", into: managedContext) as! SelfHelpDay
        return selfHelpDay
    }
    
    static func saveSelfHelpDay(){
        do {
            try managedContext.save()
        } catch let error as NSError{
            print("Saving failed \(error)")
        }
    }
    
    static func retrieveSelfHelpDay() -> [SelfHelpDay]{
        let fetchRequest = NSFetchRequest<SelfHelpDay>(entityName: "SelfHelpDay")
        do{
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError{
            print("Fetching failed \(error)")
        }
        return []
    }
    
    static func delete(selfHelpDay: SelfHelpDay){
        managedContext.delete(selfHelpDay)
        saveSelfHelpDay()
    }
    
}
