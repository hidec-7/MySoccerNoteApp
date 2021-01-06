//
//  GameRegisterViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/14.
//

import UIKit
import Firebase

class GameRegisterViewController: UIViewController, UITextFieldDelegate, UINavigationBarDelegate, UITextViewDelegate {
    
    let ref = Database.database().reference()
    
    @IBOutlet weak private var gameNavigationBar: UINavigationBar!
    @IBOutlet weak private var registerDatePicker: UIDatePicker!
    @IBOutlet weak private var teamTextField: UITextField!
    @IBOutlet weak private var myScoreTextField: UITextField!
    @IBOutlet weak private var opponentScoreTextField: UITextField!
    @IBOutlet weak private var firstHalfTextView: UITextView!
    @IBOutlet weak private var secondHalfTextView: UITextView!
    @IBOutlet weak private var matomeTextView: UITextView!
    @IBOutlet weak private var registerButton: UIButton!
    
    @IBAction private func didTapBackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameNavigationBar.delegate = self
        teamTextField.delegate = self
        myScoreTextField.delegate = self
        opponentScoreTextField.delegate = self
        
        setupFirst()
    }
    
    @IBAction func didTapRegisterButton(_ sender: UIButton) {
        createGameData()
        self.dismiss(animated: true, completion: nil)
    }
    
    func createGameData() {
        let date: String = "\(registerDatePicker.date)"
        guard let team = teamTextField.text else { return }
        guard let myScore = myScoreTextField.text else { return }
        guard let opponentScore = opponentScoreTextField.text else { return }
        let zenhan = firstHalfTextView.text
        let kouhan = secondHalfTextView.text
        let matome = matomeTextView.text
        let registerData = [
            "date": date,
            "team": team,
            "myScore": myScore,
            "opponentScore": opponentScore,
            "zenhan": zenhan as Any,
            "kouhan": kouhan as Any,
            "matome": matome as Any,
        ] as [String : Any]
        ref.child((Auth.auth().currentUser?.uid)!).childByAutoId().setValue(registerData)
    }
    
    private func setupFirst() {
        setupRegisterButton()
        setupTextView()
        setupKeyboard()
    }
    
    private func setupRegisterButton() {
        registerButton.layer.cornerRadius = 15.0
    }
    
    private func setupTextView() {
        firstHalfTextView.layer.borderWidth = 1.0
        secondHalfTextView.layer.borderWidth = 1.0
        matomeTextView.layer.borderWidth = 1.0
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    private func setupKeyboard() {
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
