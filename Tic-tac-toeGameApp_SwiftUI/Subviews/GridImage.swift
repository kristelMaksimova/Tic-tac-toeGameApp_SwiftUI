//
//  ImageGameVIew.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 10.05.2023.
//

import SwiftUI

struct GridImage: View {
    
    @State var name: String
    @State var color: Color
    
    var body: some View {
        Image(systemName: name)
            .foregroundColor(color)
            .font(.system(size: 80))
    }
}
