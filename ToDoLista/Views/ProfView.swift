//
//  ProfView.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import SwiftUI

struct ProfView: View {
    @StateObject var viewModel = ProfViewVM()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                } else {
                    Text("Loading Your profile info...")
                }
            }
            .navigationTitle("Your Profile")
        }
        .onAppear {
            viewModel.getUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Picture
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.indigo)
            .frame(width: 120, height: 120)
            .padding()
        //Info: username, email , part of our team since
        VStack(alignment: .leading) {
            HStack{
                Text("Username: ")
                    .bold()
                Text(user.name)
            }
            HStack{
                Text("Email Adress: ")
                    .bold()
                Text(user.email)
            }
            HStack{
                Text("Joined: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joinDate).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()
        //sign out
        Button("Logout"){
            viewModel.logout()
        }
        .foregroundColor(.pink)
        .padding()
        Spacer()
    }
}

#Preview {
    ProfView()
}
