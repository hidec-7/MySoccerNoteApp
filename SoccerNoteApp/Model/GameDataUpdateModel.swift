//
//  GameDataUpdateModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/02/06.
//

import Foundation
import Firebase

var gameData: GameDataModel?
var gameDataKey: String?

class GameDataUpdateModel {
    
    static func updateGameData(updateGameDate: Date, updateTeam: String, updateMyScore: String, updateOpponentScore: String, updateFirstHalf: String, updateSecondHalf: String, updateConclusion: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let updateGameStartTime = stringFromDate(date: updateGameDate)
        
        let updateGameDataDic = ["gameDate": updateGameStartTime,
                                 "team": updateTeam,
                                 "myScore": updateMyScore,
                                 "opponentScore": updateOpponentScore,
                                 "firstHalf": updateFirstHalf,
                                 "secondHalf": updateSecondHalf,
                                 "conclusion": updateConclusion]
        
        guard let uniqid = gameData?.key else {
            return print("😱nil判定")
        }
        
        let ref = Database.database().reference()
        /// 「!」は使用するとアプリクラッシュするため、guard文を使用することで「!」を回避
        ref.child(uid).child(uniqid).setValue(updateGameDataDic)
    }
    private static func stringFromDate(date: Date) -> String {
        let setupDate = DateFormatter()
        setupDate.dateFormat = "yyyy年MM月dd日HH時mm分"
        return "\(setupDate.string(from: date))"
    }
}
