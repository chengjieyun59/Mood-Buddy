//
//  ExerciseViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//TODO: put exercises in alphabetical order, users can swipe left to delete, tap to mark as complete on the checkmark in each cell, sort things as done/ undone
    @IBOutlet weak var tableView: UITableView!
    var selfHelpDay: SelfHelpDay?
    var exercises = ["Chest day", "Shoulders day", "Arms day", "Abs day", "Back day", "Butt day", "Legs day", "Pushups", "Planks", "Situps", "Crunches", "Sprints", "Runs", "Speed walks", "Squats", "Single-leg deadlifts", "Squat jumps", "Jumping Jacks", "Junmping lunges", "Reverse lunges", "Side lunges", "Spider lunges", "Walk outs", "Glute bridges", "Divebombers", "Bear Crawls", "One-leg wallsits", "Pull ups", "Calf raises", "Shoulder circles", "Box jumps", "Back extensions", "Chair dips", "Leg raises", "Mountain climbers", "Burpees"]
    /*
    var exercises = [Exercise](){
        didSet{
            tableView.reloadData()
        }
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let myExercise = CoreDataHelper.newExercise()
        myExercise.title = "Running"
        exercises.append(myExercise)
        */
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseTableViewCell", for: indexPath) as! ExerciseTableViewCell
        let row = indexPath.row
        let exercise = exercises[row]
        
        cell.exerciseLabel.text = exercise
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            exercises.remove(at: indexPath.row) //delete button is shown when user swipes left
            tableView.deleteRows(at: [indexPath], with: .fade) //does the action of deleting from the tableView
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParentViewController{
            print("back button pressed")
            // CoreDataHelper.delete(selfHelpDay: SelfHelpDay[selfHelpDay.count-1]) //delete the last one
            // self.selfHelpDay = CoreDataHelper.retrieveSelfHelpDay()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
