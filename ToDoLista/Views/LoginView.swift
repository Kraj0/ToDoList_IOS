//
//  LoginView.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewVM()
    
    var body: some View {
        NavigationView {
            VStack{
                //Header
                
                HeaderView()
                
                //Login
                
                 Form{
                     
                     if !viewModel.errorMsg.isEmpty {
                         Text(viewModel.errorMsg)
                             .foregroundColor(Color.red)
                     }
                     
                     TextField("Email Address ", text: $viewModel.email)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                     .autocorrectionDisabled()
                     
                     SecureField("Password ", text: $viewModel.password)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .autocorrectionDisabled()
                     
                     CustomButton(title: "Log in", background: .pink)
                     {
                         viewModel.login()
                     }
                 }
                 
                 
                 //Create Acc
                 VStack{
                 
                     Text("You do not have an account yet?")
                     NavigationLink("Create a new one!", destination: RegisterView())
                     
                 }
                 .padding(.bottom, 20)
            }
        }
    }
}
#Preview {
    LoginView()
}
