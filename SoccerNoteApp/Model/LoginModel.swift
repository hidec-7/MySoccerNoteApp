//
//  LoginModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/12/18.
//

import Foundation
import UIKit
import Firebase

class LoginModel {
    
    func loginFunction() {
        Auth.auth().signInAnonymously() { ( authResult, error ) in
            if error != nil{
                print("Auth Error :\(error!.localizedDescription)")
            }
            guard let user = authResult?.user else { return }
            let isAnonymous = user.isAnonymous  // true
            let uid = user.uid
        }
    }
    
}
