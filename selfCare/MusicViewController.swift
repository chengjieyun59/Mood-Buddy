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
    let musics = ["3.48 Alexander- Birds Chirping",
                  "10.00 Alexander- Meditation",
                  "5.33 Alexander- Singing Bowl",
                  "2.33 Bensound- Better Days",
                  "6.36 Bensound- Little Planet",
                  "4.16 Bensound- The Lounge",
                  "4.48 Bensound- Relaxing",]
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
        
        self.musicImages = ["Birds Chirping.jpg",
                            "Meditation.jpg",
                            "Singing Bowl.jpg",
                            "Better Days.jpg",
                            "Little Planet.jpg",
                            "The Lounge.jpg",
                            "Relaxing.jpg"]
        
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
