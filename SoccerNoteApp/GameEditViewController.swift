//
//  GameEditViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/12/04.
//

import UIKit

class GameEditViewController: UIViewController, UITextFieldDelegate, UINavigationBarDelegate {
    
    @IBOutlet weak var gameEditNavigationBar: UINavigationBar!
    @IBOutlet weak var teamEditTextField: UITextField!
    @IBOutlet weak var myScoreEditTextField: UITextField!
    @IBOutlet weak var opponentScoreEditTextField: UITextField!
    @IBOutlet weak var firstHalfEditTextView: UITextView!
    @IBOutlet weak var secondHalfEditTextView: UITextView!
    @IBOutlet weak var matomeEditTextView: UITextView!
    @IBOutlet weak var editButton: UIButton!
    
    @IBAction func didTapBackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapEditButton(_ sender: UIButton) {
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
            matomeEditTextView.layer.borderWidth = 1.0
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
