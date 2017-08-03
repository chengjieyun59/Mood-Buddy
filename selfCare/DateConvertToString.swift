//
//  DateConvertToString.swift
//  selfCare
//
//  Created by Jie-Yun Cheng on 7/20/17.
//  Copyright © 2017 Jie-Yun Cheng. All rights reserved.
//

import Foundation

extension Date {
    
    //Convert a date to a string in the format of 07/21/2017. "date formatter"
    func convertToString() -> String {
        let date = Date()
        let formatter = DateFormatter()
        let myString = formatter.string(from: date)
        let yourDate: Date? = formatter.date(from: myString)
        formatter.dateFormat = "E MM/dd/yy', 'h:mm a"
        // shows in the format of: Tue 07/25/17, 10:17 AM
        // formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let updatedString = formatter.string(from: yourDate!)
        return updatedString
    }
} //Display the date in string

extension NSDate {
    func convertToString() -> String {
        let myFormatter = DateFormatter()
        myFormatter.locale = Locale(identifier: "en_US_POSIX")
        myFormatter.dateFormat = "MMM d, ha" //Aug 03, 2PM
        // "E MM/dd/yy', 'h:mm a" is in the format of: Tue 07/25/17, 10:17 AM
        
        let updatedString = myFormatter.string(from: self as Date)
        return updatedString
        
        // return DateFormatter.localizedString(from: (self as Date), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
} //Add extension to the pre-built NSDate function

extension String {
    var isNumeric: Bool {
        guard self.characters.count > 0 else {return false}
        guard self.characters.count < 4 else {return false} //the user can only input 0-999
        let numSequence: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self.characters).isSubset(of: numSequence)
    }
} //Check if a string contains only numerical values, i.e. is a number
