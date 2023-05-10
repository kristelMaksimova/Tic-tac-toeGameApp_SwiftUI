//
//  TextFieldVIew.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 07.05.2023.
//

import SwiftUI

struct NameTextField: View {
    
    @State private var isTextFieldActive = false
    var text: Binding<String>
    @State var title = ""
    @State var color: Color
   
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(color)
                .font(.system(size: 30))
           
            TextField("", text: text, onEditingChanged: { isActive in
                self.isTextFieldActive = isActive
            })
            .padding()
            .font(.system(size: 25))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.indigo)
            )
            .background(colorScheme == .light ? Color.white : Color.black)
            .cornerRadius(10)
            .padding(.horizontal, 10)
        }
    }
}
