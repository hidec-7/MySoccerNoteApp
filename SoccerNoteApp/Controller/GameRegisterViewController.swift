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
    @IBOutlet weak private var gameDatePicker: UIDatePicker!
    @IBOutlet weak private var teamTextField: UITextField!
    @IBOutlet weak private var myScoreTextField: UITextField!
    @IBOutlet weak private var opponentScoreTextField: UITextField!
    @IBOutlet weak private var firstHalfTextView: UITextView!
    @IBOutlet weak private var secondHalfTextView: UITextView!
    @IBOutlet weak private var conclusionTextView: UITextView!
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
        if teamTextField.text!.isEmpty || myScoreTextField.text!.isEmpty || opponentScoreTextField.text!.isEmpty {
            setupAlret()
        } else {
            createGameData()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func setupAlret() {
            let alert = UIAlertController(title: "登録できません", message: "チーム名、スコアを記入してください", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "戻る", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
    }
    
    func createGameData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let team = teamTextField.text
        let myScore = myScoreTextField.text
        let opponentScore = opponentScoreTextField.text
        let firstHalf: String = firstHalfTextView.text
        let secondHalf: String = secondHalfTextView.text
        let conclusion: String = conclusionTextView.text
        let gameData = [
            "date": getGameStartTime(),
            "team": team,
            "myScore": myScore,
            "opponentScore": opponentScore,
            "frist": firstHalf,
            "second": secondHalf,
            "conclusion": conclusion,
        ]
        ref.child(uid).childByAutoId().setValue(gameData)
    }
    
    private func getGameStartTime() -> String {
        let setupDate = DateFormatter()
        setupDate.dateFormat = "yyyy年MM月dd日HH時mm分"
        return "\(setupDate.string(from: gameDatePicker.date))"
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
        conclusionTextView.layer.borderWidth = 1.0
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
