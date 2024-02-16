//
//  Extensions.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 06/02/2024.
//

import Foundation

extension Encodable{
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
