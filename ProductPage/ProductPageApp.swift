//
//  ProductPageApp.swift
//  ProductPage
//
//  Created by Juan Andres Vasquez Ferrer on 30-11-21.
//

import SwiftUI
import JJUI

@main
struct ProductPageApp: App {
    var body: some Scene {
        let themeColor = ThemeColor()
        let themeFont = ThemeFont()
        let theme = ThemeConfiguration(color: themeColor, font: themeFont)
        ThemeManager.configure(theme: theme)
        return WindowGroup {
            ContentView()
        }
    }
}
