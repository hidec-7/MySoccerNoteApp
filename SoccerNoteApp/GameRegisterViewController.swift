//
//  GameRegisterViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/14.
//

import UIKit

class GameRegisterViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var myScoreLabel: UITextField!
    @IBOutlet weak var opponentScoreLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamTextField.delegate = self
        myScoreLabel.delegate = self
        opponentScoreLabel.delegate = self
        
        setupNavigationBar()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "試合"
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
 }
