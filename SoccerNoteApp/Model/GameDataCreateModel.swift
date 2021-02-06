//
//  createGameDataModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/01/14.
//

import Foundation
import Firebase

class GameDataCreateModel {
    
    static func createGameData(gameDate: Date, team: String, myScore: String, opponentScore: String, firstHalf: String, secondHalf: String, conclusion: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let gameDateStartString = DateConverter.stringFromDate(date: gameDate)
        
        let gameDataDict = ["gameDate": gameDateStartString,
                            "team": team,
                            "myScore": myScore,
                            "opponentScore": opponentScore,
                            "firstHalf": firstHalf,
                            "secondHalf": secondHalf,
                            "conclusion": conclusion]
        
        let ref = Database.database().reference()
        ref.child(uid).childByAutoId().setValue(gameDataDict)
    }
    
}
