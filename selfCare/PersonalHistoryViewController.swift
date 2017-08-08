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
    // var screenshotDate = ["Jul 28, 7PM", "Jul 30, 8PM", "Aug 1, 5PM", "Aug 3, 10PM", "Aug 4, 7PM", "Aug 5, 8PM", "Aug 6, 7PM", "Aug 7, 7PM"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selfHelpDays = CoreDataHelper.retrieveSelfHelpDay()
        if selfHelpDays.count > 0 {
            tableView.scrollToRow(at: IndexPath(item:selfHelpDays.count-1, section: 0), at: .bottom, animated: true)
        } // scroll to the very bottom for most recent day
    } //will show anytime it shows up at the front
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = UIColor.white

        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selfHelpDays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalHistoryTableViewCell", for: indexPath) as! PersonalHistoryTableViewCell
        let row = indexPath.row
        let selfHelpDay = selfHelpDays[row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none //make the cell not change color when clicked

        // cell.selfHelpDateLabel.text = screenshotDate[indexPath.row]
        cell.selfHelpDateLabel.text = selfHelpDay.selfHelpDate?.convertToString()
        cell.timeSpentLabel.text = selfHelpDay.timeSpent
        cell.selfCareMethodLabel.text = selfHelpDay.methodUsed
        cell.feelingBeforeLabel.text = selfHelpDay.feelingBefore
        cell.feelingAfterLabel.text = selfHelpDay.feelingAfter
        
        return cell
    }
}
