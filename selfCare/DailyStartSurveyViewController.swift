//
//  DailyStartSurveyViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/18/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class DailyStartSurveyViewController: UIViewController {
    // TODO: keep the selectionType and store it and display in personalHistory view controller
    
    var selfHelpDay: SelfHelpDay?

    // outlets below
    @IBOutlet weak var inputFeelingBefore: UISegmentedControl!

    @IBOutlet weak var music: UIButton!
    @IBOutlet weak var exercise: UIButton!
    @IBOutlet weak var journal: UIButton!
    
    var selectionType = 0

    // actions below
    @IBAction func musicButton(_ sender: Any) {
        selectionType = 1
    }
    @IBAction func exerciseButton(_ sender: Any) {
        selectionType = 2
    }
    @IBAction func journalButton(_ sender: Any) {
        selectionType = 3
    }
    
    /*
    @IBAction func startDay(_ sender: Any) {
        if selectionType == 1 {
            performSegue(withIdentifier: "toMusic", sender: nil)
        }
        
        if selectionType == 2 {
            performSegue(withIdentifier: "toExercise", sender: nil)
        }
        
        if selectionType == 3 {
            performSegue(withIdentifier: "toJournal", sender: nil)
        }
        // TODO: else: pop up a notification to say they haven't selected a self-care method
    }
    */


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.isTranslucent = false
        self.tabBarController?.tabBar.tintColor = UIColor.white
    }// Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        SingletonTemporarySelfHelpDay.shared.feelingBefore = String(inputFeelingBefore.selectedSegmentIndex + 1)
        SingletonTemporarySelfHelpDay.shared.methodUsed = segue.identifier!
        
        //let selfHelpDay = self.selfHelpDay ?? CoreDataHelper.newSelfHelpDay()
        //selfHelpDay.feelingBefore = String(inputFeelingBefore.selectedSegmentIndex + 1)
        // +1 is because segment index starts at 0, then convert int to string
        //selfHelpDay.methodUsed = segue.identifier
        
        /*
        switch segue.identifier! {
        case "Music":
            let destination = segue.destination as! MusicViewController
            destination.selfHelpDay = selfHelpDay
        case "Exercise":
            let destination = segue.destination as! ExerciseViewController
            destination.selfHelpDay = selfHelpDay
        case "Journal":
            let destination = segue.destination as! JournalViewController
            destination.selfHelpDay = selfHelpDay
        default:
            return
        }
        */
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
