//
//  CustomButton.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import SwiftUI

struct CustomButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
            RoundedRectangle(cornerRadius: 5)
            .foregroundColor(background)
            
            Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    CustomButton(title: "xd", background: .blue) {
        //action
    }
}
