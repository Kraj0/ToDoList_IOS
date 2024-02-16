//
//  CreateToDoViewVM.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class CreateToDoViewVM: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    @Published var error = false
    
    init() {}
    
    func save() {
        guard validate else{
            return
        }
        
        //indetify curret userId
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //creating ToDo
        let nId = UUID().uuidString
        let nItem = Item(
            id: nId,
            title: title,
            date: date.timeIntervalSince1970,
            creationDate: Date().timeIntervalSince1970,
            Done: false
        )
        
        //saving ToDo to the database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("ToDos")
            .document(nId)
            .setData(nItem.asDictionary())
    }
    
    var validate: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        //-86400 is a number of second that exists within a day
        //it makes sure the date is greater than yesterday by subtraction of this number from current date
        guard date >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
