//
//  DateUtils.swift
//  Rectangles
//
//  Created by indraneel potnis on 26/09/21.
//

import Foundation

class DateUtils {
    static func weeks(to: Date , from date: Date) -> Int {
            return Calendar.current.dateComponents([.weekOfMonth], from: date, to: to).weekOfMonth ?? 0
    }
    
    static func daysDiff(to: Date , from date: Date) -> Int {
            return Calendar.current.dateComponents([.day], from: date, to: to).day ?? 0
    }
    
    static func hasAWeekPassed (to: Date , from date: Date ) -> Bool {
        let dateformatter = DateFormatter()

        dateformatter.dateFormat = "HH:mm:ss.SSSZ"
        
        let toDateTimeString = dateformatter.string(from: to)
        let fromDateTimeString = dateformatter.string(from: date)
        
        // handle case when exactly a week passed
        if daysDiff(to: to, from: date) == 7 && toDateTimeString == fromDateTimeString {
            return false
        }
        return weeks(to: to, from: date) > 0 ? true : false
    }
    
}
