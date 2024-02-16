//
//  ToDoVM.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import FirebaseFirestore
import Foundation

//viewmodel for the list of items

class ToDoVM: ObservableObject {
    @Published var showNewItem = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    ///deleting item from database
    /// -Id parameter is id of item to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("ToDos")
            .document(id)
            .delete()
        
    }
}
