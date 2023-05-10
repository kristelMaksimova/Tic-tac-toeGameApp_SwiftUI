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
    
    @State var playerOne: String
    @State var playerTwo: String
    
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
                                player = player == playerOne ? playerTwo : playerOne
                            }
                        }) {
                            if board[row][col] == playerOne {
                                GridImage(name: "xmark", color: Color.purple)
                            } else if board[row][col] == playerTwo {
                                GridImage(name: "circle", color: Color.cyan)
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
                saveGame(playerOne: playerOne, playerTwo: playerTwo, winner: "\(winner.winner)")
                print(news)
            })
        }
        .onAppear {
            player = playerOne
        }
    }
}

// MARK: - Algorithm

extension GameView {
    
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
    
    func resetBoard() {
        board = Array(repeating: Array(repeating: "", count: 3), count: 3)
        player = playerOne
        winner = nil
    }
}


// MARK: - Interaction with CoreData

extension GameView {
    
    func saveGame(playerOne: String, playerTwo: String, winner: String) {
        let newPlayer = Players(context: viewContext)
        newPlayer.playerOne = playerOne
        newPlayer.playerTwo = playerTwo
        newPlayer.winner = winner
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
