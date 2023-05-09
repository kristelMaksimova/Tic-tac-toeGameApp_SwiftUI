//
//  GameView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 07.05.2023.
//

import SwiftUI
import CoreData

struct GameView: View {
  
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Players.winner, ascending: true)],
                  animation: .default)
    
    private var news: FetchedResults<Players>

        @State private var board = Array(repeating: Array(repeating: "", count: 3), count: 3)
        
        @State var player1: String
        @State var player2: String
        
        @State private var player = ""
        @State private var winner: Winner? = nil
        
        @Environment(\.colorScheme) var colorScheme
        
        var body: some View {
            VStack {
                Text(winner == nil ? "\(player)'s turn" : "\(winner!.winner) wins!")
                    .font(.title)
                    .padding()
                
                ForEach(0..<3) { row in
                    HStack {
                        ForEach(0..<3) { col in
                            Button(action: {
                                if board[row][col].isEmpty && winner == nil {
                                    board[row][col] = player
                                    checkWinner()
                                    player = player == player1 ? player2 : player1
                                }
                            }) {
                                if board[row][col] == player1 {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.purple)
                                        .font(.system(size: 80))
                                } else if board[row][col] == player2 {
                                    Image(systemName: "circle")
                                        .foregroundColor(Color.cyan)
                                        .font(.system(size: 80))
                                } else {
                                    Text("")
                                        .frame(width: 100, height: 100)
                                }
                            }
                            .frame(width: 100, height: 100)
                            .background(colorScheme == .light ? Color.white : Color.black)
                            .border(colorScheme == .light ? Color.black : Color.white, width: 1)
                        }
                    }
                }
            }
            .alert(item: $winner) { winner in
                Alert(title: Text("\(winner.winner) wins!"), message: Text("Congratulations!"), dismissButton: .default(Text("Play again")) {
                    resetBoard()
                    savePlayersToCoreData(player1: player1, player2: player2, winner: "\(winner.winner)")
                    print(news)
                })
            }
            .onAppear {
                player = player1
            }
        }
        
        func checkWinner() {
            for i in 0..<3 {
                if board[i][0] == board[i][1] && board[i][1] == board[i][2] && !board[i][0].isEmpty {
                    winner = Winner(winner: board[i][0])
                }
                if board[0][i] == board[1][i] && board[1][i] == board[2][i] && !board[0][i].isEmpty {
                    winner = Winner(winner: board[0][i])
                }
            }
            if board[0][0] == board[1][1] && board[1][1] == board[2][2] && !board[0][0].isEmpty {
                winner = Winner(winner: board[0][0])
            }
            if board[0][2] == board[1][1] && board[1][1] == board[2][0] && !board[0][2].isEmpty {
                winner = Winner(winner: board[0][2])
            }
            if winner == nil && board.flatMap({ $0 }).filter({ $0.isEmpty }).count == 0 {
                winner = Winner(winner: "Nobody")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    resetBoard()
                }
            }
        }
        
        //  Очищает игровое поле
        func resetBoard() {
            board = Array(repeating: Array(repeating: "", count: 3), count: 3)
            player = player1
            winner = nil
        }
    
    func savePlayersToCoreData(player1: String, player2: String, winner: String) {
        let newPlayer = Players(context: viewContext)
        newPlayer.playerOne = player1
        newPlayer.playerTwo = player2
        newPlayer.winner = winner

        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    }


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Winner: Identifiable {
    let id = UUID()
    let winner: String
}
