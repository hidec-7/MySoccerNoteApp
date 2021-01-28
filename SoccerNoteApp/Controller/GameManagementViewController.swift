//
//  GameManagementViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/07.
//

import UIKit
import Firebase

class GameManagementViewController: UIViewController {
    
    private let cellId = "cellId"
    var gameDataArray = [GameDataModel]()
    
    @IBOutlet weak private var gameManagementTableView: UITableView!
    @IBOutlet weak private var gameAddButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerTitle()
        
        gameManagementTableView.delegate = self
        gameManagementTableView.dataSource = self
        
        gameManagementTableView.register(UINib(nibName: "GameManagementTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getGameData(table: gameManagementTableView)
    }
    
    private func getGameData(table: UITableView) {
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        gameDataArray.removeAll()
        
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
                self.gameDataArray.append(gameDate)
            }
            self.gameDataArray.reverse()
            table.reloadData()
        }
    }
    
    private func headerTitle() {
        title = "試合管理"
    }
    
}

extension GameManagementViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gameManagementTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GameManagementTableViewCell
        let gameData = gameDataArray[indexPath.row]
        cell.dateLabel.text = gameData.gameDate
        cell.opponentTeamLabel.text = gameData.team
        cell.myScoreLabel.text = gameData.myScore
        cell.opponentScoreLabel.text = gameData.opponentScore
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "gameEdit", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //CRUDのDeleteを実装する際に追記
        }
    }
}
