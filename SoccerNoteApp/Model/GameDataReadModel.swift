//
//  GameDataReadModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/01/22.
//

import Foundation
import Firebase

class GameDataReadModel {
    
    var gameDataArray = [GameDataModel]()
    
    func getGameData(table: UITableView) {
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        gameDataArray.removeAll()
        
        ref.child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            for data in snapshot.children {
                let snapData = data as! DataSnapshot
                let dictionarySnapData = snapData.value as! [String: Any]
                var gameData = GameDataModel()
                gameData.gameDate = dictionarySnapData["gameDate"] as! String
                gameData.team = dictionarySnapData["team"] as! String
                gameData.myScore = dictionarySnapData["myScore"] as! String
                gameData.opponentScore = dictionarySnapData["opponentScore"] as! String
                gameData.firstHalf = dictionarySnapData["firstHalf"] as? String ?? ""
                gameData.secondHalf = dictionarySnapData["secondHalf"] as? String ?? ""
                gameData.conclusion = dictionarySnapData["conclusion"] as? String ?? ""
                self.gameDataArray.append(gameData)
            }
            self.gameDataArray.reverse()
            table.reloadData()
        })
    }
    
}
