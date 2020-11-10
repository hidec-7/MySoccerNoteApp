//
//  GameManagementViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/07.
//

import UIKit

class GameManagementViewController: UIViewController {
    
    //この後TableViewCellのXibファイルとの紐付けに使います
    private let cellId = "cellId"
    
    @IBOutlet weak var gameManagementTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameManagementTableView.delegate = self
        gameManagementTableView.dataSource = self
        
        //仮の実装（この後TableViewCellとの紐付けの際削除する予定）
        gameManagementTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
}

extension GameManagementViewController: UITableViewDelegate,UITableViewDataSource {
    
    //今後変更の可能性あり
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //今後変更の可能性あり
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gameManagementTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
    
}
