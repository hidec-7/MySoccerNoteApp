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
    @IBOutlet private weak var myScoreTextField: UITextField!
    @IBOutlet private weak var opponentScoreTextField: UITextField!
    @IBOutlet private weak var firstHalfTextView: UITextView!
    @IBOutlet private weak var secondHalfTextView: UITextView!
    @IBOutlet private weak var conclusionTextView: UITextView!
    @IBOutlet private weak var registerButton: UIButton!

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
        .topAttached
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
