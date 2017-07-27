//
//  PersonalHistoryViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class PersonalHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selfHelpDays = [SelfHelpDay](){
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // func numberOfSections(in tableView: UITableView) -> Int {
    //     return 4
    // }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalHistoryTableViewCell", for: indexPath) as! PersonalHistoryTableViewCell
        let row = indexPath.row
        let selfHelpDay = selfHelpDays[row]
        
        cell.HistoryDate.text = selfHelpDay.exactDate?.convertToString()
        cell.HistoryTimeSpent.text = selfHelpDay.timeSpent
        cell.HistorySelfCare.text = selfHelpDay.selfHelpUsed
        cell.HistoryMoodBefore.text = selfHelpDay.feelingBefore
        cell.HistoryMoodAfter.text = selfHelpDay.feelingAfter
        
        return cell
    } // Sigabrt error shows when app launches: Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'unable to dequeue a cell with identifier PersonalHistoryTableViewCell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard'
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
