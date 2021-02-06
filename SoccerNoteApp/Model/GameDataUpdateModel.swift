//
//  GameDataUpdateModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/02/06.
//

import Foundation
import Firebase

class GameDataUpdateModel {
    
    static func updateGameData(updateGameDate: Date, updateTeam: String, updateMyScore: String, updateOpponentScore: String, updateFirstHalf: String, updateSecondHalf: String, updateConclusion: String, unipId: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let updateGameStartTime = stringFromDate(date: updateGameDate)
        
        let updateGameDataDic = ["gameDate": updateGameStartTime,
                                 "team": updateTeam,
                                 "myScore": updateMyScore,
                                 "opponentScore": updateOpponentScore,
                                 "firstHalf": updateFirstHalf,
                                 "secondHalf": updateSecondHalf,
                                 "conclusion": updateConclusion]
        
        let ref = Database.database().reference()
        ref.child(uid).child(unipId).setValue(updateGameDataDic)
    }
    private static func stringFromDate(date: Date) -> String {
        let setupDate = DateFormatter()
        setupDate.dateFormat = "yyyy年MM月dd日HH時mm分"
        return "\(setupDate.string(from: date))"
    }
}
