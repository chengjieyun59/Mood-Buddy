//
//  CongratulationsViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {
    @IBOutlet weak var NumberOfDaysLabel: UILabel!
    @IBOutlet weak var NumberOfDayStreaks: UILabel!

    // TODO: Use core data to count: (a) number of days of self care & (b) number of consecutive streak days
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //dismiss, hide back button
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }
}
