//
//  ToDoView.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoView: View {
    @StateObject var viewModel: ToDoVM
    @FirestoreQuery var items: [Item]
    
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/ToDos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoVM(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.pink)
                        }
                }
                .listStyle(SidebarListStyle())
            }
            .navigationTitle("Things To do")
            .toolbar {
                Button {
                    //action
                    viewModel.showNewItem = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.indigo)
                }
                
            }
            .sheet(isPresented: $viewModel.showNewItem) {
                CreateToDoView(newItem: $viewModel.showNewItem)
            }
        }
    }
}

#Preview {
    ToDoView(userId: "LnYMxyHgYjTJc63bUH1QvFUHHjJ3")
}
