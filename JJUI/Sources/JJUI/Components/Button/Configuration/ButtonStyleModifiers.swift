//
//  ButtonStyleModifier.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 03-12-21.
//

import Foundation
import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    
    let configuration: ButtonConfiguration
    let isPressed: Bool
    let state: ButtonState
    
    var insets: EdgeInsets {
        return EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
    }
    
    var cornerRadius: CGFloat {
        return 6
    }
    
    var foregroundColor: Color {
        if state == .disabled {
            // TODO: add to color Pallete //
            return Color(uiColor: .gray.withAlphaComponent(0.25))
        }
        switch configuration.type {
        case .primary: return .white
        case .secondary: return ThemeManager.shared.colorPallete.acent
        case .link: return ThemeManager.shared.colorPallete.acent
        }
    }
    
    var backgroundColor: Color {
        
        if state == .disabled {
            // TODO: add to color Pallete //
            return Color(uiColor: .gray.withAlphaComponent(0.1))
        }
        
        switch configuration.type {
        case .primary: return ThemeManager.shared.colorPallete.primary
        case .secondary: return ThemeManager.shared.colorPallete.secondary
        case .link: return ThemeManager.shared.colorPallete.secondary
        }
    }
    
    var height: CGFloat {
        switch configuration.size {
        case .small: return 24
        case .medium: return 32
        case .large, .fullWidth: return 48
        }
    }
    
    var width: CGFloat? {
        let isFullWidth = configuration.size == .fullWidth
        return  isFullWidth ? .infinity : nil
    }
    
    var font: Font {
        switch configuration.size {
        case .small: return ThemeManager.shared.fontsPallete.titleS
        case .medium: return  ThemeManager.shared.fontsPallete.titleM
        case .large: return ThemeManager.shared.fontsPallete.titleL
        case .fullWidth: return ThemeManager.shared.fontsPallete.titleL
        }
    }
    
    var pressBackgroundColor: Color {
        switch configuration.type {
        case .primary: return ThemeManager.shared.colorPallete.primarySelected
        case .secondary: return ThemeManager.shared.colorPallete.secondarySelected
        case .link: return ThemeManager.shared.colorPallete.secondary
        }
    }
    
    var concreteBackground: Color {
        if state == .disabled { return backgroundColor }
        if isPressed { return pressBackgroundColor }
        return backgroundColor
    }
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: width, minHeight: height, maxHeight: height)
            .foregroundColor(foregroundColor)
            .padding(insets)
            .font(font)
            .background(concreteBackground)
            .cornerRadius(cornerRadius)
    }
}
