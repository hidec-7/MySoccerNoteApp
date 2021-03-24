//
//  GameDataModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/01/17.
//

import Foundation

struct GameDataModel {

    static var gameDataListArray = [GameDataModel]()

    let key: String
    let gameDate: String
    let team: String
    let myScore: String
    let opponentScore: String
    let firstHalf: String
    let secondHalf: String
    let conclusion: String
}
