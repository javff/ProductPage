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
    
    var ringColor: Color {
        return .white
    }
    
    var size: CGSize {
        switch _size {
        case .small: return CGSize(width: 16, height: 16)
        case .medium: return CGSize(width: 24, height: 24)
        case .large: return CGSize(width: 32, height: 32)
        }
    }
    
    var font: Font {
        switch _size {
        case .small: return ThemeManager.shared.fontsPallete.titleS
        case .medium: return  ThemeManager.shared.fontsPallete.titleM
        case .large: return ThemeManager.shared.fontsPallete.titleL
        }
    }
    
    var progressLineWidth: CGFloat {
        switch _size {
        case .small: return 2
        case .medium: return 2
        case .large: return 2.5
        }
    }
    
    
    public init(size: ProgressIndicatorSize) {
        self._size = size
    }
}
