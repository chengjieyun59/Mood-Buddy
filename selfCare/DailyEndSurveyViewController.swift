//
//  DailyEndSurveyViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class DailyEndSurveyViewController: UIViewController {

    @IBOutlet weak var inputFeelingAfter: UISegmentedControl!
    @IBOutlet weak var inputTimeSpent: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps to dismiss the keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DailyEndSurveyViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    } //Calls this function when the tap is recognized.

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Save the day"{
            if !(inputTimeSpent.text?.isNumeric)! {
                let alertController = UIAlertController(title: "I see what you did there 😏", message: "Please input a reasonable integer for your time spent on self care.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler:{alert -> Void in})
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                print("User inputted a non-integer")
            } // check if user actually inputted an integer number
                
            else {
                let selfHelpDay = CoreDataHelper.newSelfHelpDay()
                
                selfHelpDay.selfHelpDate = Date() as NSDate
                selfHelpDay.feelingBefore = SingletonTemporarySelfHelpDay.shared.feelingBefore
                selfHelpDay.methodUsed = SingletonTemporarySelfHelpDay.shared.methodUsed
                selfHelpDay.timeSpent = inputTimeSpent.text ?? ""
                selfHelpDay.feelingAfter = String(inputFeelingAfter.selectedSegmentIndex + 1)
                //+1 is because segment index starts at 0, then convert int to string
                
                CoreDataHelper.saveSelfHelpDay()
                SingletonTemporarySelfHelpDay.shared.resetData() //just to be safe, though users already override the 2 variables in the beginning
            } // only save if timeSpent is an integer number
        }
    }
}
