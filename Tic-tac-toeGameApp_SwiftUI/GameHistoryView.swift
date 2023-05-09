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
                    HStack {
                        Text("\(result.playerOne ?? "") vs \(result.playerTwo ?? ""): ")
                        Text(result.winner ?? "Nobody")
                            .foregroundColor(result.winner != "Nobody" ? .green : .red)
                    }
                }
                .onDelete(perform: deleteGame) // добавляем onDelete
            }
            .navigationTitle("Game History")
        }
    }
    
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

struct GameHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        GameHistoryView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
