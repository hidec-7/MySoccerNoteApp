//
//  GameDataDeleteModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/02/08.
//

import Foundation
import Firebase

class GameDataDeleteModel {

    static func deleteGameData(indexPath: IndexPath, dataKey: String) {
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        ref.child(uid).child(dataKey).removeValue()
        GameDataModel.gameDataListArray.remove(at: indexPath.row)
    }
}
