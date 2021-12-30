//
//  ButtonConfiguration.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 01-12-21.
//

import Foundation
import SwiftUI

public struct ButtonConfiguration {
    
    let size: ButtonSize
    let type: ButtonType
    
    public var progressIndicatorConfiguration: ProgressIndicatorConfiguration {
        switch size {
        case .small: return ProgressIndicatorConfiguration(size: .xSmall, color: progressIndicatorColor)
        case .medium: return  ProgressIndicatorConfiguration(size: .small, color: progressIndicatorColor)
        case .large, .fullWidth: return ProgressIndicatorConfiguration(size: .medium, color: progressIndicatorColor)
        }
    }
    
    var progressIndicatorColor: Color {
        if type == .secondary {
            return ThemeManager.shared.colorPallete.primary
        }
        
        return .white
    }
    
    public init(size: ButtonSize, type: ButtonType) {
        self.type = type
        self.size = size
    }
}
