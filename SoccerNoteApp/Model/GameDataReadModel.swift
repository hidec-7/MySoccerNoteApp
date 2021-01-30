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

struct GameDataReadModel {
    
    static weak var delegate: GameDataReadModelDelegate?
    
    static func fetchGameData() {
        
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        GameDataModel.gameDataListArray.removeAll()
        
        ref.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            for data in snapshot.children {
                let snapData = data as! DataSnapshot
                let dictionarySnapData = snapData.value as! [String: Any]
                let gameData = GameDataModel(gameDate: dictionarySnapData["gameDate"] as! String,
                                             team: dictionarySnapData["team"] as! String,
                                             myScore: dictionarySnapData["myScore"] as! String,
                                             opponentScore: dictionarySnapData["opponentScore"] as! String,
                                             firstHalf: dictionarySnapData["firstHalf"] as? String ?? "",
                                             secondHalf: dictionarySnapData["secondHalf"] as? String ?? "",
                                             conclusion: dictionarySnapData["conclusion"] as? String ?? "")
                GameDataModel.gameDataListArray.append(gameData)
            }
            GameDataModel.gameDataListArray.reverse()
            delegate?.reloadTableViewData()
        }
    }
}
