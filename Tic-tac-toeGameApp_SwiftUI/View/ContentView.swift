//
//  ContentView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 07.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var text1 = "Players 1"
    @State private var text2 = "Players 2"
    @State private var isGameHistoryPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                TextInstructionView()
                
                TextFieldView(text: $text1, title: "Х", color: Color.purple)
                TextFieldView(text: $text2, title: "0", color: Color.cyan)
                Spacer()
                NavigationLink(
                    destination: GameView(player1: text1, player2: text2),
                    label: { TextPlayView()
                    })
            }
            .padding()
            .navigationBarItems(trailing: Button(action: { choiceOfColorTheme()},
                                                 label: { ImageRollerView()}))
            .navigationBarItems(leading: Button(action: {
                isGameHistoryPresented = true
            }, label: {
                Text("Game history")
                    .font(.system(size: 21))
            })
                .sheet(isPresented: $isGameHistoryPresented) {
                    GameHistoryView()
                })
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
