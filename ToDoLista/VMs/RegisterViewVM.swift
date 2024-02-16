//
//  RegisterViewVM.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewVM: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    init() {}
    
    func register(){
        
        error = ""
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let user = result?.user.uid else{
                return
            }
            
            self?.fillDB(id: user)
        }
    }
    
    private func fillDB(id: String){
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joinDate: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        
        error = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            error = "Please fill in login, password and username!"
            return false
        }
        
        guard password.count >= 8 else {
            error = "Password too short!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            error = "Incorrect email address"
            return false
        }
        return true
    }
    
}
