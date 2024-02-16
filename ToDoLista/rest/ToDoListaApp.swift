//
//  ToDoListaApp.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListaApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
