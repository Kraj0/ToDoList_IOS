//
//  ItemViewVM.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ItemViewVM: ObservableObject {
    init() {}
    
    func toggleDone(item: Item){
        var nItem = item    //copy of item
        nItem.setDone(!item.Done)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("ToDos")
            .document(nItem.id)
            .setData(nItem.asDictionary())
    }
}
