//
//  GameDateCreateModel.swift
//  SoccerNoteApp
//
//  Created by 渕一真 on 2021/01/16.
//

import Foundation
import Firebase

class GameDateCreateModel {
    static func createGameData(team: String, myScore: String, opponentScore: String, firstHalf: String, secondHalf: String, conclusion: String, gameData: Date) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let gameDateStartString = getGameStartTime(gemeDateString: gameData)
        
        let gameDataDict = ["gameData": gameDateStartString,
                            "team": team,
                            "myscore": myScore,
                            "opponentScore": opponentScore,
                            "frist": firstHalf,
                            "second": secondHalf,
                            "conclusion": conclusion]
        
        let ref = Database.database().reference()
        ref.child(uid).childByAutoId().setValue(gameDataDict)
    }
    
    private static func getGameStartTime(gemeDateString date: Date) -> String {
        let setupDate = DateFormatter()
        setupDate.dateFormat = "yyyy年MM月dd日HH時mm分"
        return "\(setupDate.string(from: date))"
    }
}

