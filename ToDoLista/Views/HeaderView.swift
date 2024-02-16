//
//  HeaderView.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack{
            //Header
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.indigo)
                    .rotationEffect(Angle(degrees:18))
                    .offset(y: -100)
                
                VStack{
                    Text("To Do List")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                    
                    Text("Be reliable, do not forget!")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                }
                .offset(y: -80)
            }
            .frame(width:UIScreen.main.bounds.width*3,
                   height:300)
            Spacer()
        }
    }
}

#Preview {
    HeaderView()
}
