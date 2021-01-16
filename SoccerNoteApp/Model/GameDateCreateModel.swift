//
//  GameDateCreateModel.swift
//  SoccerNoteApp
//
//  Created by 渕一真 on 2021/01/16.
//

import Foundation
import Firebase

class GameDateCreateModel {
    let ref = Database.database().reference()
    
    let team: String
    let myScore: String
    let opponentScore: String
    let firstHalf: String
    let secondHalf: String
    let conclusion: String
    let gameData: Date
    
    init(team: String, myscore: String, opponentScore: String, firstHalf: String, secondHalf: String, conclusion: String, gameData: Date) {
        self.team = team
        self.myScore = myscore
        self.opponentScore = opponentScore
        self.firstHalf = firstHalf
        self.secondHalf = secondHalf
        self.conclusion = conclusion
        self.gameData = gameData
    }
    
    func createGameData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let gameDateStartString = getGameStartTime(gemeDateString: gameData)
        
        let gameDataDict = ["gameData": gameDateStartString,
                            "team": team,
                            "myscore": myScore,
                            "opponentScore": opponentScore,
                            "frist": firstHalf,
                            "second": secondHalf,
                            "conclusion": conclusion]
        
        ref.child(uid).childByAutoId().setValue(gameDataDict)
    }
    
    private func getGameStartTime(gemeDateString date: Date) -> String {
        let setupDate = DateFormatter()
        setupDate.dateFormat = "yyyy年MM月dd日HH時mm分"
        return "\(setupDate.string(from: date))"
    }
}

