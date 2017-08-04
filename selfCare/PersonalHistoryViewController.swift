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
        
    } // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.tabBarController?.tabBar.tintColor = UIColor.white
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selfHelpDays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalHistoryTableViewCell", for: indexPath) as! PersonalHistoryTableViewCell
        let row = indexPath.row
        let selfHelpDay = selfHelpDays[row]

        cell.selfHelpDateLabel.text = selfHelpDay.selfHelpDate?.convertToString()
        cell.timeSpentLabel.text = selfHelpDay.timeSpent
        cell.selfCareMethodLabel.text = selfHelpDay.methodUsed
        cell.feelingBeforeLabel.text = selfHelpDay.feelingBefore
        cell.feelingAfterLabel.text = selfHelpDay.feelingAfter
        
        return cell
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
