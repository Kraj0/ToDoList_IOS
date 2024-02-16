//
//  ProfViewVM.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfViewVM: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    
    func getUser(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joinDate: data["joinDate"] as? TimeInterval ?? 0)
            }
        }
        
    }
    
    func logout(){
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
