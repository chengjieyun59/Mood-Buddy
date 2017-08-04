//
//  SingletonTemporarySelfHelpDay.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 8/4/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import Foundation

final class SingletonTemporarySelfHelpDay {
    
    //static variable is only accessible by this one class, so only one instance exist. That's why it's called a singleton. Apple calls it "shared" or "current".
    static let shared = SingletonTemporarySelfHelpDay() //"shared" is a singleton. It's an instance of itself
    
    var feelingBefore: String = ""
    var methodUsed: String = ""
    
    func resetData() {
        feelingBefore = ""
        methodUsed = ""
    }
}
