//
//  GameDataModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/01/17.
//

import Foundation

struct GameDataModel {
    
    static var gameDataListArray = [GameDataModel]()
    
    var gameDate: String
    var team: String
    var myScore: String
    var opponentScore: String
    var firstHalf: String
    var secondHalf: String
    var conclusion: String
    var Key: String

}
