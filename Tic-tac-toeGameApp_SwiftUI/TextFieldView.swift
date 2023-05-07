//
//  TextFieldVIew.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 07.05.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var isTextFieldActive = false
    @State var text = ""
    @State var title = ""
    @State var color: Color
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(color)
                .font(.system(size: 24))
           
            TextField("", text: $text, onEditingChanged: { isActive in
                self.isTextFieldActive = isActive
            })
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isTextFieldActive ? Color.blue : Color.gray, lineWidth: 2)
            )
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal, 10)
        }
    }
}

