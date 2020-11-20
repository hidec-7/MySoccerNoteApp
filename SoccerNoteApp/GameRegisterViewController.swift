//
//  GameRegisterViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/14.
//

import UIKit

class GameRegisterViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var myScoreTextField: UITextField!
    @IBOutlet weak var opponentScoreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamTextField.delegate = self
        myScoreTextField.delegate = self
        opponentScoreTextField.delegate = self
        
        self.myScoreTextField.keyboardType = UIKeyboardType.numberPad
        self.opponentScoreTextField.keyboardType = UIKeyboardType.numberPad
        
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
