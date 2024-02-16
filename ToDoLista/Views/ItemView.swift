//
//  ItemView.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import SwiftUI

struct ItemView: View {
    let item: Item
    @StateObject var viewModel = ItemViewVM()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970:item.date).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button{
                viewModel.toggleDone(item: item)
            } label: {
                Image(systemName: item.Done ? "checkmark.square.fill" : "square")
                    .foregroundColor(.indigo)
            }
        }
    }
}

#Preview {
    ItemView(item: .init(id: "123",
                         title: "Finish project",
                         date: Date().timeIntervalSince1970,
                         creationDate: Date().timeIntervalSince1970,
                         Done: true))
}
