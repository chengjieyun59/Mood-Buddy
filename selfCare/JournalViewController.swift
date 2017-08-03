//
//  JournalViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController, UITextViewDelegate {
    var shouldEnableUserInteraction: Bool = true
    var journal: Journal?
    var selfHelpDay: SelfHelpDay?
    let color = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0).cgColor //same light gray color as the textfield border
    let sameColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0) //sameColor is UIColor, while color is CGColor
    
    @IBOutlet weak var journalTitle: UITextField!
    @IBOutlet weak var journalContent: UITextView!
    @IBOutlet weak var journalDoneButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        journalTitle.text = journal?.title ?? ""
        journalContent.text = journal?.content ?? "" //displayed from core data
        
        if (journalContent.isEditable) {
            let alertController = UIAlertController(title: "Dismiss keyboard", message: "Tap outside the text boxes to dismiss keyboard.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler:{alert -> Void in})
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } //Todo: show this once only
        
        if shouldEnableUserInteraction == true { //meaning this is the first time typing in this journal entry
            journalContent.delegate = self //textVdiew delegate
            journalContent.text = "What happened today? How do you feel? Type it here." //have a placeholder text
            journalContent.textColor = sameColor //make the placeholder text light gray
        }
        
        journalContent.layer.borderColor = color //defined above viewWillAppear function
        journalContent.layer.borderWidth = 0.6
        journalContent.layer.cornerRadius = 5 //these 3 lines add a thin gray border for the text view, so that it matches with the text field above it
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveAndDoneForTheDay"{
            if (journalContent.text == "What happened today? How do you feel? Type it here.") || (journalTitle.text == "") {
                let alertController = UIAlertController(title: "😏", message: "Type something, buddy!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler:{alert -> Void in})
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                let journal = self.journal ?? CoreDataHelper.newJournal()
                journal.title = journalTitle.text ?? ""
                journal.content = journalContent.text ?? ""
                journal.modificationTime = Date() as NSDate
                CoreDataHelper.saveJournal()
                let destination = segue.destination as! DailyEndSurveyViewController
                destination.selfHelpDay = selfHelpDay
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps to dismiss the keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DailyEndSurveyViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        if shouldEnableUserInteraction != true {
            journalTitle.text = journal?.title ?? ""
            journalContent.text = journal?.content ?? ""
            
            //disable user interaction
            journalTitle.isUserInteractionEnabled = false
            journalContent.isScrollEnabled = true
            journalContent.isEditable = false
            journalDoneButton.isHidden = true //dismiss the done button
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) { // when the user starts editting,
        if journalContent.textColor == sameColor {
            journalContent.text = nil // the placeholder text should disappear,
            journalContent.textColor = UIColor(red: 86/255, green: 62/255, blue: 44/255, alpha: 1.0) // and user input should change from light gray to brown
        }
    }
    
    // if the text view is still empty after the user finish editting, then put back the light grey placeholder
    func textViewDidEndEditing(_ textView: UITextView) {
        if journalContent.text.isEmpty {
            journalContent.text = "What happened today? How do you feel? Type it here."
            journalContent.textColor = sameColor
        }
    }
    
    //Calls this function when the tap is recognized outside text field, text view, and back button
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
