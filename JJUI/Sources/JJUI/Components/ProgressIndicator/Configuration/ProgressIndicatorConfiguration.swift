//
//  ProgressIndicatorConfiguration.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 13-12-21.
//

import Foundation
import SwiftUI

public struct ProgressIndicatorConfiguration {
    
    private let _size: ProgressIndicatorSize
    private let color: Color
    
    var ringColor: Color {
        return color
    }
    
    var size: CGSize {
        switch _size {
        case .xSmall: return CGSize(width: 16, height: 16)
        case .small: return CGSize(width: 24, height: 24)
        case .medium: return CGSize(width: 32, height: 32)
        case .large: return CGSize(width: 48, height: 48)
        case .xLarge: return CGSize(width: 64, height: 64)
        }
    }
    
    var font: Font {
        switch _size {
        case .xSmall: return ThemeManager.shared.fontsPallete.labelS
        case .small: return ThemeManager.shared.fontsPallete.labelS
        case .medium: return  ThemeManager.shared.fontsPallete.labelS
        case .large: return ThemeManager.shared.fontsPallete.labelM
        case .xLarge: return ThemeManager.shared.fontsPallete.labelL
        }
    }
    
    var progressLineWidth: CGFloat {
        switch _size {
        case .xSmall: return 2
        case .small: return 2.5
        case .medium: return 3
        case .large: return 4
        case .xLarge: return 4
        }
    }
    
    public init(size: ProgressIndicatorSize, color: Color) {
        self._size = size
        self.color = color
    }
}
