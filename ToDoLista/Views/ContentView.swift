//
//  ContentView.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewVM()
    
    var body: some View {
        if viewModel.isLogged, !viewModel.currentUserId.isEmpty{
            accView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accView: some View {
        TabView{
            ToDoView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Homepage", systemImage: "house")
                }
            ProfView()
                .tabItem {
                    Label("Profile", systemImage:
                            "person.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
