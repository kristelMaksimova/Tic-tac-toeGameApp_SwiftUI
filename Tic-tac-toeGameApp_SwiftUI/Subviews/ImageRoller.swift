//
//  ImageRollerView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 10.05.2023.
//

import SwiftUI

struct ImageRoller: View {
   
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Image(colorScheme == .light ? "blackRoller" : "lightRoller")
            .resizable()
            .frame(width: 60, height: 60)
    }
}

struct ImageRollerView_Previews: PreviewProvider {
    static var previews: some View {
        ImageRoller()
    }
}
