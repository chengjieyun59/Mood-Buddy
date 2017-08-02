//
//  DailyEndSurveyViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class DailyEndSurveyViewController: UIViewController {

    var selfHelpDay: SelfHelpDay?
    // TODO: save inputted feelingAfter &  timeSpent on self care
    var convertedFeelingAfter = 0
    @IBOutlet weak var inputFeelingAfter: UISegmentedControl!
    @IBOutlet weak var inputTimeSpent: UITextField!
    @IBAction func saveTheDay(_ sender: Any) {
        // TODO: save the day
        convertedFeelingAfter = inputFeelingAfter.selectedSegmentIndex + 1 //segmentIndex starts at 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps to dismiss the keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DailyEndSurveyViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ""{
            let selfHelpDay = self.selfHelpDay ?? CoreDataHelper.newSelfHelpDay()

            selfHelpDay.timeSpent = inputTimeSpent.text ?? ""
            selfHelpDay.feelingAfter = String(convertedFeelingAfter) //convert int to string
            selfHelpDay.selfHelpDate = Date() as NSDate
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
