//
//  GameDataUpdateModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/02/04.
//

import Foundation
import Firebase

var gameData: GameDataModel?
var gameDataKey: String?

class GameDataUpdateModel {
    
    static func updateGameData(updGameDate: Date, updTeam: String, updMyScore: String, updOpponentScore: String, updFirstHalf: String, updSecondHalf: String, updConclusion: String) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let updateGameStartTime = stringFromDate(date: updGameDate)
        
        let updateGameDatadic = ["gameDate": updateGameStartTime,
                                 "team": updTeam,
                                 "myScore": updMyScore,
                                 "opponentScore": updOpponentScore,
                                 "firstHalf": updFirstHalf,
                                 "secondHalf": updSecondHalf,
                                 "conclusion": updConclusion]
        gameDataKey = gameData?.Key
        
        let ref = Database.database().reference()
        ref.child(uid).child(gameDataKey!).setValue(updateGameDatadic)
    }
    
    private static func stringFromDate(date: Date) -> String {
        let setupDate = DateFormatter()
        setupDate.dateFormat = "yyyy年MM月dd日HH時mm分"
        return "\(setupDate.string(from: date))"
    }
    
}
