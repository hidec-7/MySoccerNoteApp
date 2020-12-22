//
//  LoginModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/12/18.
//

import Foundation
import Firebase

class LoginModel {
    
    let error: String? = "Auth Error:\(LocalizedError.self)"
    
    func anonymous() {
        Auth.auth().signInAnonymously() { ( authResult, error ) in
            if let AuthError = error {
                print(AuthError)
            }
            guard let user = authResult?.user else { return }
            _ = user.isAnonymous  // true
            _ = user.uid
            return
        }
    }
    
}
