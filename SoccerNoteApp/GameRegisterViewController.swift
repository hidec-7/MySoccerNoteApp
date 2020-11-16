//
//  GameRegisterViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/14.
//

import UIKit

class GameRegisterViewController: UIViewController {
    
    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var myScoreLabel: UITextField!
    @IBOutlet weak var opponentScoreLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()

    }
    
    func setupNavigationBar() {
        navigationItem.title = "試合"
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
 }
