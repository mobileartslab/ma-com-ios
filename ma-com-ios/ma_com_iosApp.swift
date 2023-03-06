//
//  ma_com_iosApp.swift
//  ma-com-ios
//
//  Created by Nick Sophinos on 3/6/23.
//

import SwiftUI

@main
struct ma_com_iosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
