//
//  GameHistoryView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 09.05.2023.
//

import SwiftUI
import CoreData

struct GameHistoryView: View {
  
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Players.entity(), sortDescriptors: []) var gameResults: FetchedResults<Players>

    var body: some View {
        NavigationView {
            List {
                ForEach(gameResults, id: \.self) { result in
                    GameHistoryCellText(playerOneName: result.playerOne ?? "", playerTwoName: result.playerTwo ?? "", playerWinName: result.winner)
                }
                .onDelete(perform: deleteGame)
            }
            .navigationTitle("Game History")
        }
    }
}

// MARK: - Interaction with CoreData

extension GameHistoryView {
    
    func deleteGame(at offsets: IndexSet) {
        offsets.forEach { index in
            let game = gameResults[index]
            viewContext.delete(game)
        }
        do {
            try viewContext.save()
        } catch {
            print("Error deleting game: \(error)")
        }
    }
}
