//
//  GameManagementViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/02.
//

import UIKit

class GameManagementViewController: UIViewController {

    private let cellId = "cellId"
    
    @IBOutlet weak var gameManagementTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameManagementTableView.delegate = self
        gameManagementTableView.dataSource = self

    }

}

extension GameManagementViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = gameManagementTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
        
    }
    
    
    
    
}

class GameManagementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var VSLabel: UILabel!
    @IBOutlet weak var opponentLabel: UILabel!
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var ratioLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
