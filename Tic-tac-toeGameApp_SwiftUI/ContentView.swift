//
//  ContentView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 07.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var text1 = ""
    @State private var text2 = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Введите имена игроков")
                    .padding()
                Spacer()
                
                TextFieldView(text: text1, title: "Х", color: Color.purple)
                    .padding(.vertical)
                TextFieldView(text: text2, title: "0", color: Color.cyan)
                Spacer()
                NavigationLink(
                                   destination: GameView(),
                                   label: {
                                       Text("Играть")
                                           .foregroundColor(.white)
                                           .font(.title2)
                                           .frame(maxWidth: .infinity)
                                           .padding()
                                           .background(Color.indigo)
                                           .cornerRadius(10)
                                   })
            }
            .padding()
            .navigationBarItems(trailing: Button(action: {
                choiceOfColorTheme()
            }, label: {
                Image(colorScheme == .light ? "blackRoller" : "lightRoller")
                    .resizable()
                    .frame(width: 60, height: 60)
            })

            )
            .navigationBarItems(leading: Button(action: {
                
            }, label: {
                Text("История игр")
            })
            )
        }
    }
    
    func choiceOfColorTheme () {
        if colorScheme == .dark {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
        } else {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
