//
//  JournalViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController {

    var journal: Journal?
    @IBOutlet weak var journalTitle: UITextField!
    @IBOutlet weak var journalContent: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        journalTitle.text = journal?.title ?? ""
        journalContent.text = journal?.content ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveAndDoneForTheDay"{
            let journal = self.journal ?? CoreDataHelper.newJournal()
            journal.title = journalTitle.text ?? ""
            journal.content = journalContent.text ?? ""
            journal.modificationTime = Date() as NSDate
            CoreDataHelper.saveJournal()
        }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
