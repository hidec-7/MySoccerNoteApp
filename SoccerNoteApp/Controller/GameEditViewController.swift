//
//  GameEditViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/12/04.
//

import UIKit

class GameEditViewController: UIViewController, UITextFieldDelegate, UINavigationBarDelegate {

    var gameData: GameDataModel?

    @IBOutlet private weak var gameEditNavigationBar: UINavigationBar!

    @IBOutlet private weak var gameEditDatePicker: UIDatePicker! {
        didSet {
            gameEditDatePicker.date = DateConverter.dateFromString(date: gameData?.gameDate ?? "") ?? gameEditDatePicker.date
        }
    }
    @IBOutlet private weak var teamEditTextField: UITextField! {
        didSet {
            teamEditTextField.text = gameData?.team
        }
    }
    @IBOutlet private weak var myScoreEditTextField: UITextField! {
        didSet {
            myScoreEditTextField.keyboardType = UIKeyboardType.numberPad
            myScoreEditTextField.text = gameData?.myScore
        }
    }
    @IBOutlet private weak var opponentScoreEditTextField: UITextField! {
        didSet {
            opponentScoreEditTextField.keyboardType = UIKeyboardType.numberPad
            opponentScoreEditTextField.text = gameData?.opponentScore
        }
    }

    @IBOutlet private weak var firstHalfEditTextView: UITextView! {
        didSet {
            firstHalfEditTextView.layer.borderWidth = 1.2
            firstHalfEditTextView.text = gameData?.firstHalf
        }
    }

    @IBOutlet private weak var secondHalfEditTextView: UITextView! {
        didSet {
            secondHalfEditTextView.layer.borderWidth = 1.2
            secondHalfEditTextView.text = gameData?.secondHalf
        }
    }

    @IBOutlet private weak var conclusionEditTextView: UITextView! {
        didSet {
            conclusionEditTextView.layer.borderWidth = 1.2
            conclusionEditTextView.text = gameData?.conclusion
        }
    }
    @IBOutlet private weak var editButton: UIButton! {
        didSet {
            editButton.layer.cornerRadius = 25.0
        }
    }

    @IBAction private func didTapBackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        gameEditNavigationBar.delegate = self
        teamEditTextField.delegate = self
        myScoreEditTextField.delegate = self
        opponentScoreEditTextField.delegate = self
    }

    @IBAction func didTapEditButton(_ sender: UIButton) {
        GameDataUpdateModel.updateGameData(unipID: gameData?.key ?? "",
                                           gameDate: gameEditDatePicker.date,
                                           team: teamEditTextField.text ?? "",
                                           myScore: myScoreEditTextField.text ?? "",
                                           opponentScore: opponentScoreEditTextField.text ?? "",
                                           firstHalf: firstHalfEditTextView.text,
                                           secondHalf: secondHalfEditTextView.text,
                                           conclusion: conclusionEditTextView.text)
        self.dismiss(animated: true, completion: nil)
    }

    func position(for bar: UIBarPositioning) -> UIBarPosition {
        .topAttached
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
