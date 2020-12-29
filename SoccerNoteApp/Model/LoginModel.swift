//
//  LoginModel.swift
//  SoccerNoteApp
//
//  Created by hideto c. on 2020/12/18.
//

import Foundation
import Firebase

class LoginModel {
    
    func anonymous() {
        Auth.auth().signInAnonymously() { ( authResult, error ) in
            if let error = error {
                print("Auth Error :\(error.localizedDescription)")
            }else{
                print("")
            }
            guard let user = authResult?.user else { return }
            _ = user.isAnonymous  // true
            _ = user.uid
            return
        }
    }
    
}
