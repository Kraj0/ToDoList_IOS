//
//  RegisterView.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewVM()
    
    var body: some View {
        NavigationView {
            VStack{
                //Header
                
                RegisterHeaderView()
                
                //register
                
                 Form{
                     
                     if !viewModel.error.isEmpty {
                         Text(viewModel.error)
                             .foregroundColor(Color.red)
                     }
                     TextField("Username ", text: $viewModel.name)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .autocorrectionDisabled()
                 
                     TextField("Email Address ", text: $viewModel.email)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .autocorrectionDisabled()
                     .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                     
                     SecureField("New Password ", text: $viewModel.password)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .autocorrectionDisabled()
                     
                     CustomButton(title: "Register Now", background: .green)
                     {
                         // Attempt registration
                         viewModel.register()
                     }
                 }
                 .offset(y:-50)
                 Spacer()
                 //text
                 VStack{
                 
                     Text("You already have an account?")
                     Text("Back to home page and log in!")
                 }
                 .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    RegisterView()
}
