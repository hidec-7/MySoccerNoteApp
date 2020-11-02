//
//  GameManagementViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/02.
//

import UIKit

class GameManagementViewController: UIViewController {

    @IBOutlet weak var gameManagementTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
