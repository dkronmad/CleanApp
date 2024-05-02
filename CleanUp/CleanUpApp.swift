//
//  CleanUpApp.swift
//  CleanUp
//
//  Created by Ronni Madsen on 26/10/2023.
//

import SwiftUI

@main
struct CleanUpApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        MenuBarExtra("Clean App", systemImage: "house.circle")
        {
            Button("Hide Apps") {}
            Button("Show Apps") {}
            Divider()
            Button("Quit") { NSApp.terminate(nil) }
        }
//        .menuBarExtraStyle(.window)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBar: NSStatusBar!
    var statusBarItem: NSStatusItem!
    var menu: NSMenu!
      
    // Flag to toggle showing/hiding the app list
    var showAppList: Bool = true
  
    func applicationDidFinishLaunching(_ notification: Notification) {
        statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
        statusBarItem.button?.title = "AppList"
  
        menu = NSMenu()
        statusBarItem.menu = menu
        updateMenuItems()
    }
      
    func updateMenuItems() {
        menu.removeAllItems()
          
        // Toggle Menu Item
        menu.addItem(NSMenuItem(title: "Toggle App List", action: #selector(toggleAppList), keyEquivalent: ""))
          
        // Conditionally show app list
        if showAppList {
            var listOfApps = NSWorkspace.shared.runningApplications
            // Example: Add a static list of items, replace with dynamic content as needed
            for app in listOfApps {
                menu.addItem(NSMenuItem(title: app.localizedName! + " - " + app.isActive.description, action: (nil), keyEquivalent: ""))
            }
//            menu.addItem(NSMenuItem(title: listOfApps.first!.description, action: nil, keyEquivalent: ""))
//            menu.addItem(NSMenuItem(title: "App 2", action: nil, keyEquivalent: ""))
            // Add more items as needed
        }
          
        // Always show an option to quit the app
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
    }
      
    @objc func toggleAppList() {
        showAppList.toggle()
        updateMenuItems()
    }
}
