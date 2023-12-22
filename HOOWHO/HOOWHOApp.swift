//
//  HOOWHOApp.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

import SwiftUI

@main
struct HOOWHOApp: App {
    var body: some Scene {
            #if os(iOS)
            WindowGroup {
                TabView {
                    ContentView()
                        .tabItem {
                            Label("Journal", systemImage: "book")
                        }
                    
                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
                }
            }
            #elseif os(macOS)
            WindowGroup {
                AlternativeContentView()
            }
            
            Settings {
                SettingsView()
            }
            #endif
        }
    }
