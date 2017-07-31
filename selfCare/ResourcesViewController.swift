//
//  ResourcesViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let resources = ["1. National Suicide Hotline", "2. Depression Hotline", "3. Support for Sexual Assault Survivors", "4. Support for LGBTQIA", "5. 30 Day Meditation Challenge", "6. 30 Day Life-Changing Challenges", "7. Improve Relationships with Others", "8. Improve Quality of Life"]

    /*
    func openURL() {
        if #available(iOS 10.0, *){
            UIApplication.shared.open(url1, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url1)
        }
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceTableViewCell", for: indexPath) as! ResourceTableViewCell
        let row = indexPath.row
        let resource = resources[row]
        
        cell.resourceLabel.text = resource
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.tabBarController?.tabBar.tintColor = UIColor.white
        // Dispose of any resources that can be recreated.
    }
    
    // tap cell to open respective URLs in Safari
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // openURL()
        let url : NSURL?
        switch indexPath.row{
        case 0:
            url = NSURL(string: "https://suicidepreventionlifeline.org/") //National Suicide Hotline
        case 1:
            url = NSURL(string: "https://www.mentalhelp.net/articles/depression-hotline/") //Depression Hotline
        case 2:
            url = NSURL(string: "https://www.rainn.org/national-resources-sexual-assault-survivors-and-their-loved-ones") //Support for Sexual Assault Survivors
        case 3:
            url = NSURL(string: "http://www.glbtnationalhelpcenter.org/") //Support for LGBTQIA
        case 4:
            url = NSURL(string: "https://www.youtube.com/playlist?list=PLF78_4TwdUj-XGrceHHlv2Rhz_aKB6wYs") //30 Day Meditation Challenge
        case 5:
            url = NSURL(string: "http://embracingsimpleblog.com/fifteen-30-day-challenge-ideas-will-change-life/") //30 Day Life-Changing Challenges
        case 6:
            url = NSURL(string: "http://optimallivingdaily.com/category/optimal-living-daily-relationships/") //Improve Relationships with Others
        case 7:
            url = NSURL(string: "http://optimallivingdaily.com/category/optimallivingdaily/") //Improve Quality of Life
        default:
            return;
        }
        if url != nil{
            // UIApplication.shared.openURL(url! as URL)
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
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
