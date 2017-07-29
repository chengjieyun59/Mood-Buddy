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

    let musics = ["cat", "life", "crash"]

    func playSound(soundName : String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicTableViewCell", for: indexPath) as! MusicTableViewCell
        let row = indexPath.row
        let music = musics[row]
        
        cell.musicLabel.text = music
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // tap cell to play
    // tap cell again to stop
    // tap another cell: stop current one and start that one
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playSound(soundName: musics[indexPath.row])
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
