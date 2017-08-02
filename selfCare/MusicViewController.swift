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
    
    // var image1 : UIImage = UIImage(named: "rock")!
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicTableViewCell", for: indexPath) as! MusicTableViewCell
        let row = indexPath.row
        let music = musics[row]
        
        cell.musicLabel.text = music
        // cell.imageView?.image = image1
        cell.imageView?.image = UIImage(named: musicImages[indexPath.row])
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // tap cell to play
    // tap same cell again to stop
    // tap another cell, stop current one and start the new one
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped cell")
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
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DoneForTheDay", sound != nil {
            sound.stop()
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
