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
        
        tableView.delegate = self
        tableView.dataSource = self
        journals = CoreDataHelper.retrieveJournals()
        // Do any additional setup after loading the view.
    } // this gets called every time right after the view loads
    
    override func viewWillAppear(_ animated: Bool) {
        journals = CoreDataHelper.retrieveJournals()
    } // this gets called every time the user switch tab

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournayHistoryTableViewCell", for: indexPath) as! JournalHistoryTableViewCell
        
        //let reversedRow = journals.count - indexPath.row - 1
        //let journal = journals[reversedRow]
        //the 2 lines above is equivalent to the 2 lines below
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
            CoreDataHelper.delete(journal: journals.reversed()[indexPath.row])
            journals = CoreDataHelper.retrieveJournals()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
