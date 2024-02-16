//
//  CreateToDoView.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import SwiftUI

struct CreateToDoView: View {
    @StateObject var viewModel = CreateToDoViewVM()
    @Binding var newItem: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 28))
                .bold()
                .padding(.top, 50)
            
            Form{
                //name
                TextField("What to do", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //do date
                DatePicker("Deadline", selection: $viewModel.date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //button
                CustomButton(title: "Add",
                    background: .pink){
                    if viewModel.validate {
                        viewModel.save()
                        newItem = false
                    } else {
                        viewModel.error = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.error) {
                Alert(
                    title: Text("Error when creating ToDo"),
                    message: Text("Please fill all fields and select correct deadline"))
            }
        }
    }
}

#Preview {
    CreateToDoView(newItem: Binding(get: {
        return true
    },set: { _ in
    }))
}
