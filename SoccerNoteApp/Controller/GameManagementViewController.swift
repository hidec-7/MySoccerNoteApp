//
//  GameManagementViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/07.
//

import UIKit

class GameManagementViewController: UIViewController {
    
    private let cellId = "cellId"
    var data: GameDataModel?
    var indicater = UIActivityIndicatorView()
    
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
        setupIndicater()
    }
    
    private func headerTitle() {
        title = "試合管理"
    }
    
    private func setupIndicater() {
        indicater.center = view.center
        indicater.style = .large
        indicater.color = UIColor(red: 44/255, green: 169/255, blue: 225/255, alpha: 1)
        view.addSubview(indicater)
        
        indicater.startAnimating()
        DispatchQueue.global(qos: .default).async {
            Thread.sleep(forTimeInterval: 1)
            DispatchQueue.main.async {
                GameDataReadModel.fetchGameData()
                self.indicater.stopAnimating()
            }
        }
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
            showAlertDeleteGameData(indexPath: indexPath)
        }
    }
    
    private func showAlertDeleteGameData(indexPath: IndexPath) {
        let deleteAlert = UIAlertController(title: "確認", message: "この試合を削除しますか？", preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "削除", style: .destructive) { (_) in
            self.data = GameDataModel.gameDataListArray[indexPath.row]
            GameDataDeleteModel.deleteGameData(indexPath: indexPath, dataKey: self.data?.key ?? "")
            self.gameManagementTableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
        }
        deleteAlert.addAction(cancelAction)
        deleteAlert.addAction(deleteAction)
        present(deleteAlert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "削除"
    }
}

extension GameManagementViewController: GameDataReadModelDelegate {
    func reloadTableViewData() {
        gameManagementTableView.reloadData()
    }
}
