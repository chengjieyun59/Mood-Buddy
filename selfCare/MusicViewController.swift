//
//  MusicViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit
import AVFoundation

class MusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var sound: AVAudioPlayer!
    let musics = ["10.00 Meditation- Alexander",
                  "6.36 Little Planet- Bensound",
                  "5.33 Singing Bowl- Alexander",
                  "4.48 Relaxing- Bensound",
                  "4.16 The Lounge- Bensound",
                  "3.48 Birds Chirping- Alexander",
                  "2.33 Better Days- Bensound",]
    var selfHelpDay: SelfHelpDay?
        var musicImages : [String]!
    var rowPlaying: Int = 8 //used to check if the same cell is tapped again to stop music
    
    func playSound(soundName : String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        do {
            sound = try AVAudioPlayer(contentsOf: url!)
            sound.play()
        } catch {
            print("error loading file")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.musicImages = ["Meditation.jpg",
                            "Little Planet.jpg",
                            "Singing Bowl.jpg",
                            "Relaxing.jpg",
                            "The Lounge.jpg",
                            "Birds Chirping.jpg",
                            "Better Days.jpg",]
        
        let checkDisplay3 = UserDefaults.standard.bool(forKey: "alert3WasDisplayed") //default is false
        if checkDisplay3 == false {
            let alertController = UIAlertController(title: "Warning", message: "Make sure your phone is NOT on silent mode, but ringing mode. Tap on each row to listen to music 🎶. Tap again to stop.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "alert3WasDisplayed")
        } // Show only once
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicTableViewCell", for: indexPath) as! MusicTableViewCell
        let row = indexPath.row
        let music = musics[row]
        
        cell.musicLabel.text = music
        cell.imageView?.image = UIImage(named: musicImages[indexPath.row])
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if sound != nil {
            if sound.isPlaying == true, rowPlaying == indexPath.row {
                sound.stop() //only stop is the same cell is tapped
            }
            else {
                playSound(soundName: musics[indexPath.row])
                rowPlaying = indexPath.row
            }
        }
            
        else {
            playSound(soundName: musics[indexPath.row])
            rowPlaying = indexPath.row
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    } // Function gets called when cell is tapped. Tap cell to play. Tap same cell again to stop. Tap another cell, stop current one and start the new one

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DoneForTheDay", sound != nil {
            sound.stop()
        }
    }
}
