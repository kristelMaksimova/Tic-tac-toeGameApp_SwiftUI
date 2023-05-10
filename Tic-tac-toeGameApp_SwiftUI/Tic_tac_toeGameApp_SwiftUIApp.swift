//
//  Tic_tac_toeGameApp_SwiftUIApp.swift
//  Tic-tac-toeGameApp_SwiftUI
//
//  Created by Kristi on 07.05.2023.
//

import SwiftUI

@main
struct Tic_tac_toeGameApp_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PlayerRegistrationView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
