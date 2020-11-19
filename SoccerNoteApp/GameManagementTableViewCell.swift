//
//  GameManagementTableViewCell.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/07.
//

import UIKit

class GameManagementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var VSLabel: UILabel!
    @IBOutlet weak var opponentTeamLabel: UILabel!
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var versusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
