//
//  LogInViewModel.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 13.09.2022.
//

import Foundation
import FirebaseAuth


class LoginViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var loggedIn: Bool = false
    
    var isLoggedIn: Bool {
        return auth.currentUser != nil
    }
    
    func logIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //Success
                self?.loggedIn = true
            }

        }
        
    }
    
    func register(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //Success
                self?.loggedIn = true
            }
        }
        
    }
    
    func logOut() {
        try? auth.signOut()
        
        self.loggedIn = false
    }
}
