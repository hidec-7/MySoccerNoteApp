//
//  GameEditViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/12/04.
//

import UIKit

class GameEditViewController: UIViewController, UITextFieldDelegate, UINavigationBarDelegate {
    
    var gameData: GameDataModel?
    
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
        gameManagementData()
    }
    
    @IBAction func didTapEditButton(_ sender: UIButton) {
        GameDataUpdateModel.updateGameData(unipId: gameData?.key ?? "",
                                           gameDate: gameEditDatePicker.date,
                                           team: teamEditTextField.text ?? "",
                                           myScore: myScoreEditTextField.text ?? "",
                                           opponentScore: opponentScoreEditTextField.text ?? "",
                                           firstHalf: firstHalfEditTextView.text,
                                           secondHalf: secondHalfEditTextView.text,
                                           conclusion: conclusionEditTextView.text)
        self.dismiss(animated: true, completion: nil)
    }
    
    private func gameManagementData() {
        gameEditDatePicker.date = DateConverter.dateFromString(date: gameData?.gameDate ?? "")
        teamEditTextField.text = gameData?.team
        myScoreEditTextField.text = gameData?.myScore
        opponentScoreEditTextField.text = gameData?.opponentScore
        firstHalfEditTextView.text = gameData?.firstHalf
        secondHalfEditTextView.text = gameData?.secondHalf
        conclusionEditTextView.text = gameData?.conclusion
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

