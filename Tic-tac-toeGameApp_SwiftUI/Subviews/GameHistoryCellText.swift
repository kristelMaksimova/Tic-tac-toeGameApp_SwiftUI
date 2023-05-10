//
//  GameHistoryTextView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 10.05.2023.
//

import SwiftUI

struct GameHistoryCellText: View {
    
    @State var playerOneName: String
    @State var playerTwoName: String
    @State var playerWinName: String?
    
    var body: some View {
        HStack {
            Text("\(playerOneName) vs \(playerTwoName): ")
                .font(.system(size: 21))
            Text(playerWinName ?? "Nobody")
                .foregroundColor(playerWinName != "Nobody" ? .green : .red)
                .font(.system(size: 21))
        }
    }
}
