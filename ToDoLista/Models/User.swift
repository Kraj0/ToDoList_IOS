//
//  User.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joinDate: TimeInterval
}
