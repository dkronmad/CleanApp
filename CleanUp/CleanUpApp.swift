//
//  CleanUpApp.swift
//  CleanUp
//
//  Created by Ronni Madsen on 26/10/2023.
//

import SwiftUI

@main
struct CleanUpApp: App {
    
    var body: some Scene {
        MenuBarExtra("Clean App", systemImage: "house.circle")
        {
            Button("Enable Keyboard") {}
            Button("Disable Keyboard") {}
            Divider()
            Button("Quit") { NSApp.terminate(nil) }
        }
//        .menuBarExtraStyle(.window)
    }
}
