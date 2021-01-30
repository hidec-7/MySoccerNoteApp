//
//  GameDataReadModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/01/22.
//

import Foundation
import Firebase

protocol GameDataReadModelDelegate: AnyObject {
    func reloadTableViewData() -> Void
}

class GameDataReadModel {
    
    static weak var delegate: GameDataReadModelDelegate?
    
    static func getGameData() {
        
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        GameDataModel.gameDataListArray.removeAll()
        
        ref.child(uid).observeSingleEvent(of: .value) { (snapshot) in
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
                GameDataModel.gameDataListArray.append(gameData)
            }
            GameDataModel.gameDataListArray.reverse()
            delegate?.reloadTableViewData()
        }
    }
}
