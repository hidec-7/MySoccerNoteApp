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
        getGameData()
    }
    
    private func getGameData() {
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        ref.child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            self.gameDataArray = []
            
            for data in snapshot.children {
                let snapData = data as! DataSnapshot
                let dictionarySnapData = snapData.value as! [String: Any]
                
                var gameData = GameDataModel()
                gameData.setFromDictionary(dictionarySnapData)
                self.gameDataArray.append(gameData)
            }
            self.gameManagementTableView.reloadData()
        })
    }
    
    private func headerTitle() {
        title = "試合管理"
    }
   
}

extension GameManagementViewController: UITableViewDelegate, UITableViewDataSource {
    
    //今後変更の可能性あり
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //今後変更の可能性あり
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gameManagementTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let gameData = gameDataArray[indexPath.row]
        let teamLabel = cell.viewWithTag(1) as! UILabel
        teamLabel.text = gameData.team
        let myScoreLabel = cell.viewWithTag(2) as! UILabel
        myScoreLabel.text = gameData.myScore
        let opponentScore = cell.viewWithTag(3) as! UILabel
        opponentScore.text = gameData.opponentScore
        let date = cell.viewWithTag(4) as! UILabel
        date.text = gameData.gameDate
         
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
