//
//  ContentView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 07.05.2023.
//

import SwiftUI

struct PlayerRegistrationView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var firstPlayerName = "Players 1"
    @State private var secondPlayerName = "Players 2"
    @State private var isGameHistoryPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                textOnPlayerRegistration()
                
                NameTextField(text: $firstPlayerName, title: "Х", color: Color.purple)
                NameTextField(text: $secondPlayerName, title: "0", color: Color.cyan)
                Spacer()
                NavigationLink(
                    destination: GameView(playerOne: firstPlayerName, playerTwo: secondPlayerName),
                    label: { PlayButtonText()
                    })
            }
            .padding()
            .navigationBarItems(trailing: Button(action: { choiceOfColorTheme()},
                                                 label: { ImageRoller()}))
            .navigationBarItems(leading: Button(action: { isGameHistoryPresented.toggle()},
                                                label: { GameHistoryText()})
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
