//
//  GameRegisterViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/14.
//

import UIKit

class GameRegisterViewController: UIViewController,UITextFieldDelegate,UINavigationBarDelegate {
    
    @IBOutlet weak var gameNavigationBar: UINavigationBar!
    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var myScoreTextField: UITextField!
    @IBOutlet weak var opponentScoreTextField: UITextField!
    
    @IBAction func backToGameManagement(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameNavigationBar.delegate = self
        teamTextField.delegate = self
        myScoreTextField.delegate = self
        opponentScoreTextField.delegate = self
        
        setupKeyboard()
        
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    func setupKeyboard() {
        self.myScoreTextField.keyboardType = UIKeyboardType.numberPad
        self.opponentScoreTextField.keyboardType = UIKeyboardType.numberPad
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
 }
