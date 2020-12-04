//
//  GameEditViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/12/04.
//

import UIKit

class GameEditViewController: UIViewController,UINavigationBarDelegate {
    
    @IBOutlet weak var gameEditNavigationBar: UINavigationBar!
    @IBOutlet weak var teamEditTextField: UITextField!
    @IBOutlet var myScoreEditTextField: UIView!
    @IBOutlet weak var opponentScoreTextField: UITextField!
    
    @IBAction func didTapBackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameEditNavigationBar.delegate = self
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }

}
