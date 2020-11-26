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
    @IBOutlet weak var firstHalfTextView: UITextView!
    @IBOutlet weak var secondHalfTextView: UITextView!
    @IBOutlet weak var matomeTextView: UITextView!
    
    @IBAction func backToGameManagement(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameNavigationBar.delegate = self
        teamTextField.delegate = self
        myScoreTextField.delegate = self
        opponentScoreTextField.delegate = self
        
        setupKeyboard()
        setupTextView()
    }
    
    func setupTextView() {
        firstHalfTextView.layer.borderWidth = 1.0
        secondHalfTextView.layer.borderWidth = 1.0
        matomeTextView.layer.borderWidth = 1.0
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
