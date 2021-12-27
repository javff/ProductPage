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
        case .small: return ProgressIndicatorConfiguration(size: .small)
        case .medium: return  ProgressIndicatorConfiguration(size: .medium)
        case .large, .fullWidth: return ProgressIndicatorConfiguration(size: .large)
        }
    }
    
    public init(size: ButtonSize, type: ButtonType) {
        self.type = type
        self.size = size
    }
}
