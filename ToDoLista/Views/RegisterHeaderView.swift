//
//  RegisterHeaderView.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import SwiftUI

struct RegisterHeaderView: View {
    var body: some View {
        VStack{
            //Header
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.pink)
                    .rotationEffect(Angle(degrees:18))
                    .offset(y: -140)
                
                VStack{
                    Text("Register")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                    
                    Text("Become part of our team!")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                }
                .offset(y: -120)
            }
            .frame(width:UIScreen.main.bounds.width*3,
                   height:300)
            Spacer()
        }
    }
}

#Preview {
    RegisterHeaderView()
}
