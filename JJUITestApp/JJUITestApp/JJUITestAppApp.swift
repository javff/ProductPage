//
//  JJUITestAppApp.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 28-12-21.
//

import SwiftUI
import JJUI

@main
struct JJUITestAppApp: App {
    
    var body: some Scene {
        let routerManager = Navigator(router: Router())
        let themeColor = ThemeColor()
        let themeFont = ThemeFont()
        let theme = ThemeConfiguration(color: themeColor, font: themeFont)
        ThemeManager.configure(theme: theme)
        return WindowGroup {
            ContentView()
                .environmentObject(routerManager)
        }
    }
}
