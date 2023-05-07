//
//  NavButtonView.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 07.05.2023.
//

import SwiftUI

struct NavButtonView: View {
    
    @State var colorScheme: ColorScheme
    
    var body: some View {
        Button(action: {
            choiceOfColorTheme()
        }, label: {
            Image(colorScheme == .light ? "blackRoller" : "lightRoller")
                .resizable()
                .frame(width: 60, height: 60)
        })
    }
    
    func choiceOfColorTheme () {
        if colorScheme == .dark {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
        } else {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
        }
    }
}

