//
//  CongratulationsViewController.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //dismiss, hide back button
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }
}
