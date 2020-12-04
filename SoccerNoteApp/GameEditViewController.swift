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
    @IBOutlet var myScoreEditTextField: UIView!
    @IBOutlet weak var opponentScoreTextField: UITextField!
    @IBOutlet weak var firstHalfEditTextView: UIStackView!
    @IBOutlet weak var secondHalfEditTextView: UITextView!
    @IBOutlet weak var matomeEditTextView: UITextView!
    
    @IBAction func didTapBackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameEditNavigationBar.delegate = self
        
        setupFirst()
    }
    
    private func setupFirst() {
        setupTextView()
    }
    
    private func setupTextView() {
            firstHalfEditTextView.layer.borderWidth = 1.0
            secondHalfEditTextView.layer.borderWidth = 1.0
            matomeEditTextView.layer.borderWidth = 1.0
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }

}
