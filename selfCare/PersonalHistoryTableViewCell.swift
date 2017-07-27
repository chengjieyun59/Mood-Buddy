//
//  PersonalHistoryTableViewCell.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/27/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import Foundation
import UIKit

class PersonalHistoryTableViewCell: UITableViewCell{
    @IBOutlet weak var HistoryDate: UILabel!
    @IBOutlet weak var HistoryTimeSpent: UILabel!
    @IBOutlet weak var HistorySelfCare: UILabel!
    @IBOutlet weak var HistoryMoodBefore: UILabel!
    @IBOutlet weak var HistoryMoodAfter: UILabel!
}
