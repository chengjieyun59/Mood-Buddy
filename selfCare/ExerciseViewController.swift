//
//  ExerciseViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var selfHelpDay: SelfHelpDay?
    var exercises = ["Chest day", "Shoulders day", "Arms day", "Abs day", "Back day", "Butt day", "Legs day", "Pushups", "Planks", "Situps", "Crunches", "Sprints", "Runs", "Speed walks", "Squats", "Single-leg deadlifts", "Squat jumps", "Jumping Jacks", "Junmping lunges", "Reverse lunges", "Side lunges", "Spider lunges", "Walk outs", "Glute bridges", "Divebombers", "Bear Crawls", "One-leg wallsits", "Pull ups", "Calf raises", "Shoulder circles", "Box jumps", "Back extensions", "Chair dips", "Leg raises", "Mountain climbers", "Burpees"]

    override func viewDidLoad() {
        super.viewDidLoad()
      
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
}
