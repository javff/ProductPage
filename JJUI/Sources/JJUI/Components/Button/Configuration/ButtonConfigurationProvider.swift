//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 01-12-21.
//

import Foundation
import SwiftUI

struct ButtonConfigurationProvider: ButtonStyle {
        
    let configuration: ButtonConfiguration
    let state: ButtonState
    
    func makeBody(configuration: Configuration) -> some View {
        let modifier = ButtonStyleModifier(
            configuration: self.configuration,
            isPressed: configuration.isPressed,
            state: state
        )
        configuration.label.modifier(modifier)
    }
}

