//
//  GameDataModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/01/17.
//

import Foundation

struct GameDataModel {
    
    var gameDate: String = ""
    var team: String = ""
    var myScore: String = ""
    var opponentScore: String = ""
    var firstHalf: String = ""
    var secondHalf: String = ""
    var conclusion: String = ""
    
    mutating func setFromDictionary(_ dictionary: [String: Any]) {
        gameDate = dictionary["gameDate"] as? String ?? ""
        team = dictionary["team"] as? String ?? ""
        myScore = dictionary["myScore"] as? String ?? ""
        opponentScore = dictionary["opponentScore"] as? String ?? ""
        firstHalf = dictionary["firstHalf"] as? String ?? ""
        secondHalf = dictionary["secondHalf"] as? String ?? ""
        conclusion = dictionary["conclusion"] as? String ?? ""
    }
}
