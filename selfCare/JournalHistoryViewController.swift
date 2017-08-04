//
//  JournalHistoryViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class JournalHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var journals = [Journal](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = UIColor.white
        
        if tutorialHasBeenDisplayed1 == false, journals.count == 1{
            tutorialHasBeenDisplayed1 = true
            let alertController = UIAlertController(title: "Warning", message: "You can’t edit the journal, but you can swipe left to delete each journal", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }// show only once and when there's one journal entry that users can try deleting
        
        tableView.delegate = self
        tableView.dataSource = self
        journals = CoreDataHelper.retrieveJournals()
    } // this gets called every time right after the view loads
    
    override func viewWillAppear(_ animated: Bool) {
        journals = CoreDataHelper.retrieveJournals()
    } // this gets called every time the user switch tab
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournayHistoryTableViewCell", for: indexPath) as! JournalHistoryTableViewCell
        let row = indexPath.row
        let journal = journals.reversed()[row] //reverse journal order so the last one is on top
        
        cell.JournalTitleLabel.text = journal.title
        cell.JournalContentLabel.text = journal.content
        cell.JournalModificationTimeLabel.text = journal.modificationTime?.convertToString()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "displayJournal"{
                print("User displayed a journal")
                let indexPath = tableView.indexPathForSelectedRow!
                let journal = journals.reversed()[indexPath.row]
                let journalViewController = segue.destination as! JournalViewController
                journalViewController.journal = journal
                journalViewController.shouldEnableUserInteraction = false // disable user interaction in JournalViewController ViewDidLoad function
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete{
            let alertController = UIAlertController(title: "Warning", message: "Do you really want to delete this journal entry?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler:{ Void in //.destructive shows in red
                CoreDataHelper.delete(journal: self.journals.reversed()[indexPath.row])
                self.journals = CoreDataHelper.retrieveJournals()
            }) //only delete journal when user is sure
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:{Void in
                self.tableView.isEditing = false // automatically swipe back the delete button
            }) //journal entry not deleted
            
            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
