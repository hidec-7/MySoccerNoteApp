//
//  SlideMenuViewController.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2021/04/17.
//

import UIKit

class SlideMenuViewController: UIViewController {

    @IBOutlet private weak var slideMenuView: UIView!
    @IBOutlet private weak var nonMenuView: UIView!

    @IBAction func contactButton(_ sender: UIButton) {
        let url = NSURL(string: "https://form.run/@hideto-chaya--1614329817")
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSlideMenu()
    }

    private func setupSlideMenu() {
        let menuPosi = self.slideMenuView.layer.position
        self.slideMenuView.layer.position.x = self.slideMenuView.frame.width

        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            self.slideMenuView.layer.position.x = menuPosi.x
        } completion: { _ in }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches where touch.view == nonMenuView {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                self.slideMenuView.layer.position.x = -self.slideMenuView.frame.width
            } completion: { _ in
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
