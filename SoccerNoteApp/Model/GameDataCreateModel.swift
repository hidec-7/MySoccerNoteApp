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
        
        let gameDateStartString = getGameStartTime(gameDateString: gameDate)
        
        let gameDataDict = ["gameDate": gameDateStartString,
                            "team": team,
                            "myScore": myScore,
                            "opponentScore": opponentScore,
                            "first": firstHalf,
                            "second": secondHalf,
                            "conclusion": conclusion]
        
        let ref = Database.database().reference()
        ref.child(uid).childByAutoId().setValue(gameDataDict)
    }
    
    private static func getGameStartTime(gameDateString date: Date) -> String {
        let setupDate = DateFormatter()
        setupDate.dateFormat = "yyyy年MM月dd日HH時mm分"
        return "\(setupDate.string(from: date))"
    }
}
