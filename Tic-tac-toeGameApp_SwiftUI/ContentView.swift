//
//  ContentView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 07.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var text1 = "Игрок 1"
    @State private var text2 = "Игрок 2"
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Введите имена игроков")
                    .font(.title)
                    .foregroundColor(Color.indigo)
                    .padding()
                
                TextFieldView(text: $text1, title: "Х", color: Color.purple)
                TextFieldView(text: $text2, title: "0", color: Color.cyan)
                
                Spacer()
                NavigationLink(
                    destination: GameView(player1: text1, player2: text2),
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
                    .font(.system(size: 21))
            })
            )
        }
    }
    
    func choiceOfColorTheme () {
        if colorScheme == .dark {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.first?.overrideUserInterfaceStyle = .light
            }
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.first?.overrideUserInterfaceStyle = .dark
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
