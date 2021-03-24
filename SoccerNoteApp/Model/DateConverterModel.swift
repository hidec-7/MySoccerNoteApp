//
//  DateConverterModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/02/07.
//

import Foundation

class DateConverter {

    static func stringFromDate(date: Date) -> String {
        let setupDate = DateFormatter()
        setupDate.dateFormat = "yyyy年MM月dd日HH時mm分"
        return "\(setupDate.string(from: date))"
    }

    static func dateFromString(date: String) -> Date? {
        let setupDate = DateFormatter()
        setupDate.dateFormat = "yyyy年MM月dd日HH時mm分"
        return setupDate.date(from: date)
    }
}
