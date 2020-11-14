//
//  GameRegisterViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/11/14.
//

import UIKit

class GameRegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NavigationBar()

    }
    
    func NavigationBar() {
        navigationItem.title = "試合"
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
 }
