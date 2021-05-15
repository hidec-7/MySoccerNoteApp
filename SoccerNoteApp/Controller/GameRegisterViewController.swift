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

    @IBOutlet private weak var gameNavigationBar: UINavigationBar!
    @IBOutlet private weak var gameDatePicker: UIDatePicker!
    @IBOutlet private weak var teamTextField: UITextField!
    @IBOutlet private weak var myScoreTextField: UITextField! {
        didSet {
            myScoreTextField.keyboardType = UIKeyboardType.numberPad
        }
    }
    @IBOutlet private weak var opponentScoreTextField: UITextField! {
        didSet {
            opponentScoreTextField.keyboardType = UIKeyboardType.numberPad
        }
    }
    @IBOutlet private weak var firstHalfTextView: UITextView! {
        didSet {
            firstHalfTextView.layer.borderWidth = 1.2
        }
    }
    @IBOutlet private weak var secondHalfTextView: UITextView! {
        didSet {
            secondHalfTextView.layer.borderWidth = 1.2
        }
    }
    @IBOutlet private weak var conclusionTextView: UITextView! {
        didSet {
            conclusionTextView.layer.borderWidth = 1.2
        }
    }
    @IBOutlet private weak var registerButton: UIButton! {
        didSet {
            registerButton.layer.cornerRadius = 25.0
        }
    }

    @IBAction private func didTapBackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        gameNavigationBar.delegate = self
        teamTextField.delegate = self
        myScoreTextField.delegate = self
        opponentScoreTextField.delegate = self
    }

    @IBAction func didTapRegisterButton(_ sender: UIButton) {
        if teamTextField.text!.isEmpty || myScoreTextField.text!.isEmpty || opponentScoreTextField.text!.isEmpty {
            showAlertInvalidRegister()
        } else {
            GameDataCreateModel.createGameData(gameDate: gameDatePicker.date,
                                               team: teamTextField.text ?? "",
                                               myScore: myScoreTextField.text ?? "",
                                               opponentScore: opponentScoreTextField.text ?? "",
                                               firstHalf: firstHalfTextView.text,
                                               secondHalf: secondHalfTextView.text,
                                               conclusion: conclusionTextView.text)
            self.dismiss(animated: true, completion: nil)
        }
    }

    private func showAlertInvalidRegister() {
        let alert = UIAlertController(title: "登録できません", message: "チーム名、スコアを記入してください", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "戻る", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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
