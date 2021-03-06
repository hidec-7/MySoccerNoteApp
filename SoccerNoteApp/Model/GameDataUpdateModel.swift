//
//  GameDataUpdateModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/02/06.
//

import Foundation
import Firebase

class GameDataUpdateModel {
    
    static func updateGameData(unipID: String, gameDate: Date, team: String, myScore: String, opponentScore: String, firstHalf: String, secondHalf: String, conclusion: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let updateGameStartTime = DateConverter.stringFromDate(date: gameDate)
        
        let updateGameDataDic = ["gameDate": updateGameStartTime,
                                 "team": team,
                                 "myScore": myScore,
                                 "opponentScore": opponentScore,
                                 "firstHalf": firstHalf,
                                 "secondHalf": secondHalf,
                                 "conclusion": conclusion]
        
        let ref = Database.database().reference()
        ref.child(uid).child(unipID).setValue(updateGameDataDic)
    }
}
