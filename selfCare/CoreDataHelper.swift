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
    
    // static methods
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
}

class selfHelpDay{
    // TODO: display 4 columns of saved data: date, selection, feelingBefore, feelingAfter

    // let feelingBefore
    // let feelingAfter

    // let selection: String = ""
    
    // switch selectionType{
    // case 1:
    // selection = "music"
    // case 2:
    // selection = "exercise"
    // case 3:
    // selection = "journal"
    // }
    
    
}




