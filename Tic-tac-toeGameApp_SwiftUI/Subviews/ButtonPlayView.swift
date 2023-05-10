//
//  ButtonPlayView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 10.05.2023.
//

import SwiftUI

struct ButtonPlayView: View {
    
    @State var text1 : String
    @State var text2 : String
    
    var body: some View {
        NavigationLink(
            destination: GameView(player1: text1, player2: text2),
            label: {
                Text("Play")
                    .foregroundColor(.white)
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.indigo)
                    .cornerRadius(10)
            })
    }
}

