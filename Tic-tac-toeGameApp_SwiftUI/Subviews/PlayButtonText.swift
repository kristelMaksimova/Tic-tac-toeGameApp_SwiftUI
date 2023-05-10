//
//  TextPlayView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 10.05.2023.
//

import SwiftUI

struct PlayButtonText: View {
    var body: some View {
        Text("Играть")
            .foregroundColor(.white)
            .font(.title2)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.indigo)
            .cornerRadius(10)
    }
}

struct TextPlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayButtonText()
    }
}
