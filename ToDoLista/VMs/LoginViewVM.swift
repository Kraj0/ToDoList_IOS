//
//  LoginViewVM.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import FirebaseAuth
import Foundation

class LoginViewVM: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMsg = ""
    
    init() {}
    
    func login() {
        guard validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMsg = ""
        guard !email.trimmingCharacters(in:.whitespaces).isEmpty,
              !password.trimmingCharacters(in:.whitespaces).isEmpty else {
            
            errorMsg = "Please fill in login and password!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMsg = "Incorrect email address"
            return false
        }
        return true
    }
}
