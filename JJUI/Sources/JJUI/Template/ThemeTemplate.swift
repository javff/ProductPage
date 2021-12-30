//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 01-12-21.
//

import Foundation
import SwiftUI

public protocol ThemeColorTemplate: AnyObject {
    var acent: Color { get }
    var primary: Color { get }
    var secondary: Color { get }
    
    var primarySelected: Color { get }
    var secondarySelected: Color { get }
}

public protocol ThemeFontTemplate: AnyObject {
    var titleL: Font { get }
    var titleM: Font { get }
    var titleS: Font { get }
    
    var labelL: Font { get }
    var labelM: Font { get }
    var labelS: Font { get }
}

public struct ThemeConfiguration {
    let colorPallete: ThemeColorTemplate
    let fontsPallete: ThemeFontTemplate
    
    public init(color: ThemeColorTemplate, font: ThemeFontTemplate) {
        self.colorPallete = color
        self.fontsPallete = font
    }
}

public final class ThemeManager {
    
    static private var _theme: ThemeConfiguration?
    
    private var theme: ThemeConfiguration {
        guard let theme = ThemeManager._theme else { fatalError("Should configure theme") }
        return theme
    }
    
    public var colorPallete: ThemeColorTemplate {
        return theme.colorPallete
    }
    
    public var fontsPallete: ThemeFontTemplate {
        return theme.fontsPallete
    }
    
    public static let shared = ThemeManager()
    private init() {}
    
    public class func configure(theme: ThemeConfiguration) {
        ThemeManager._theme = theme
    }
}


//MARK - Tema de test

final public class ThemeColor: ThemeColorTemplate {
    public let acent: Color = Color(hex: "#3483FA")
    public let primary: Color = Color(hex: "#3483FA")
    public let secondary: Color = Color(red: 0.25, green: 0.54, blue: 0.90, opacity: 0.15)
    public var primarySelected: Color = Color(hex: "#1F4E96")
    public var secondarySelected: Color = Color(red: 0.25, green: 0.54, blue: 0.90, opacity: 0.30)

    public init() {}
}


final public class ThemeFont: ThemeFontTemplate {
    public var titleL: Font = .system(size: 16)
    public var titleM: Font = .system(size: 14)
    public var titleS: Font = .system(size: 12)
    
    public var labelL: Font = .system(size: 22)
    public var labelM: Font = .system(size: 20)
    public var labelS: Font = .system(size: 18)
    
    public init() {}
}
