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
    var data: GameDataModel?
    
    @IBOutlet weak private var gameManagementTableView: UITableView!
    @IBOutlet weak private var gameAddButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerTitle()

        gameManagementTableView.delegate = self
        gameManagementTableView.dataSource = self
        GameDataReadModel.delegate = self
        
        gameManagementTableView.register(UINib(nibName: "GameManagementTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GameDataReadModel.fetchGameData()
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
        return GameDataModel.gameDataListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gameManagementTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GameManagementTableViewCell
        let gameData = GameDataModel.gameDataListArray[indexPath.row]
        cell.dateLabel.text = gameData.gameDate
        cell.opponentTeamLabel.text = gameData.team
        cell.myScoreLabel.text = gameData.myScore
        cell.opponentScoreLabel.text = gameData.opponentScore
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data = GameDataModel.gameDataListArray[indexPath.row]
        performSegue(withIdentifier: "gameEdit", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameEdit" {
            let editVC = segue.destination as! GameEditViewController
            editVC.gameData = data
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteGameData(indexPath: indexPath)
            gameManagementTableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
        }
    }
    
    private func deleteGameData(indexPath: IndexPath) {
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        data = GameDataModel.gameDataListArray[indexPath.row]
        ref.child(uid).child(data?.key ?? "").removeValue()
        GameDataModel.gameDataListArray.remove(at: indexPath.row)
    }
}

extension GameManagementViewController: GameDataReadModelDelegate {
    func reloadTableViewData() {
        gameManagementTableView.reloadData()
    }
}
