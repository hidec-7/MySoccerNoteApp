//
//  GameEditViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/12/04.
//

import UIKit
import Firebase

class GameEditViewController: UIViewController, UITextFieldDelegate, UINavigationBarDelegate {
    
    var gameData: GameDataModel!
    var key: String!
    
    @IBOutlet weak private var gameEditNavigationBar: UINavigationBar!
    @IBOutlet weak private var gameEditDatePicker: UIDatePicker!
    @IBOutlet weak private var teamEditTextField: UITextField!
    @IBOutlet weak private var myScoreEditTextField: UITextField!
    @IBOutlet weak private var opponentScoreEditTextField: UITextField!
    @IBOutlet weak private var firstHalfEditTextView: UITextView!
    @IBOutlet weak private var secondHalfEditTextView: UITextView!
    @IBOutlet weak private var conclusionEditTextView: UITextView!
    @IBOutlet weak private var editButton: UIButton!
    
    @IBAction private func didTapBackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameEditNavigationBar.delegate = self
        teamEditTextField.delegate = self
        myScoreEditTextField.delegate = self
        opponentScoreEditTextField.delegate = self
        
        setupFirst()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        editGameData()
    }
    
    @IBAction func didTapEditButton(_ sender: UIButton) {
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        var updateGameData = gameData
        updateGameData?.gameDate = stringFromDate(date: gameEditDatePicker.date)
        updateGameData?.team = teamEditTextField.text ?? ""
        updateGameData?.myScore = myScoreEditTextField.text ?? ""
        updateGameData?.opponentScore = opponentScoreEditTextField.text ?? ""
        updateGameData?.firstHalf = firstHalfEditTextView.text
        updateGameData?.secondHalf = secondHalfEditTextView.text
        updateGameData?.conclusion = conclusionEditTextView.text
        
        ref.child(uid).child(key).setValue(updateGameData)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    private func editGameData() {
        gameEditDatePicker.date = dateFromString(dateString: gameData.gameDate)
        teamEditTextField.text = gameData.team
        myScoreEditTextField.text = gameData.myScore
        opponentScoreEditTextField.text = gameData.opponentScore
        firstHalfEditTextView.text = gameData.firstHalf
        secondHalfEditTextView.text = gameData.secondHalf
        conclusionEditTextView.text = gameData.conclusion
    }
    
    private func dateFromString(dateString: String) -> Date {
        let setupDate = DateFormatter()
        setupDate.dateFormat = gameData.gameDate
        return setupDate.date(from: dateString)!
    }
    
    private func stringFromDate(date: Date) -> String {
        let setupDate = DateFormatter()
        setupDate.dateFormat = "yyyy年MM月dd日HH時mm分"
        return "\(setupDate.string(from: date))"
    }
    
    private func setupFirst() {
        setupKeyboard()
        setupEditButton()
        setupEditTextView()
    }
    
    private func setupKeyboard() {
        myScoreEditTextField.keyboardType = UIKeyboardType.numberPad
        opponentScoreEditTextField.keyboardType = UIKeyboardType.numberPad
    }
    
    private func setupEditButton() {
        editButton.layer.cornerRadius = 15.0
    }
    
    private func setupEditTextView() {
        firstHalfEditTextView.layer.borderWidth = 1.0
        secondHalfEditTextView.layer.borderWidth = 1.0
        conclusionEditTextView.layer.borderWidth = 1.0
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
