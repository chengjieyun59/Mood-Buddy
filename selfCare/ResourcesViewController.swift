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
    let resources = ["National Suicide Hotline"]
    let url1 = URL(string: "https://suicidepreventionlifeline.org/")!

    func openURL() {
        if #available(iOS 10.0, *){
            UIApplication.shared.open(url1, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url1)
        }
    }
    
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
    
    // tap cell to open url in safari
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openURL()
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
