//
//  TextInstructionView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 10.05.2023.
//

import SwiftUI

struct textOnPlayerRegistration: View {
    var body: some View {
        Text("Enter player names")
            .font(.title)
            .foregroundColor(Color.indigo)
            .padding()
    }
}

struct TextInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        textOnPlayerRegistration()
    }
}
