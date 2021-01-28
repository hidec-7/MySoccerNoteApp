//
//  GameDataReadModel.swift
//  SoccerNoteApp
//
//  Created by 渕一真 on 2021/01/28.
//

import Foundation
import Firebase

class GameDataReadModel {
    static func getGameData(table: UITableView) {
        
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
                
        GameDataModel.gameDataListArray.removeAll()
        
        ref.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            for data in snapshot.children {
                let snapData = data as! DataSnapshot
                let dictionarySnapData = snapData.value as! [String: Any]
                let gameDate = GameDataModel(gameDate: dictionarySnapData["gameDate"] as! String,
                                             team: dictionarySnapData["team"] as! String,
                                             myScore: dictionarySnapData["myScore"] as! String,
                                             opponentScore: dictionarySnapData["opponentScore"] as! String,
                                             firstHalf: dictionarySnapData["firstHalf"] as? String ?? "",
                                             secondHalf: dictionarySnapData["secondHalf"] as? String ?? "",
                                             conclusion: dictionarySnapData["conclusion"] as? String ?? "")
                GameDataModel.gameDataListArray.append(gameDate)
            }
            GameDataModel.gameDataListArray.reverse()
            table.reloadData()
        }
    }
}
