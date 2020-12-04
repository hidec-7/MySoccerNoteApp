//
//  GameEditViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/12/04.
//

import UIKit

class GameEditViewController: UIViewController,UINavigationBarDelegate {
    
    @IBOutlet weak var gameEditNavigationBar: UINavigationBar!
    @IBOutlet weak var teamEditTextField: UITextField!
    @IBOutlet weak var myScoreEditTextField: UITextField!
    @IBOutlet weak var opponentScoreEditTextField: UITextField!
    @IBOutlet weak var firstHalfEditTextView: UITextView!
    @IBOutlet weak var secondHalfEditTextView: UITextView!
    @IBOutlet weak var matomeEditTextView: UITextView!
    @IBOutlet weak var registerEditButton: UIButton!
    
    @IBAction func didTapBackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapRegisterEditButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameEditNavigationBar.delegate = self
        
        setupFirst()
    }
    
    private func setupFirst() {
        setupRegisterEditButton()
        setupEditTextView()
    }
    
    private func setupRegisterEditButton() {
        registerEditButton.layer.cornerRadius = 15.0
    }
    
    private func setupEditTextView() {
            firstHalfEditTextView.layer.borderWidth = 1.0
            secondHalfEditTextView.layer.borderWidth = 1.0
            matomeEditTextView.layer.borderWidth = 1.0
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }

}
