//
//  SwiftUIView.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 01-12-21.
//

import SwiftUI

/// This UIComponents represent a button with standard look and feel.
public struct JJUIButton: View {
    
    public let text: String
    public let icon: AppButtonIcon?
    public var configuration: ButtonConfiguration
    @Binding public var state: ButtonState
    public var action: (() -> Void)
    
    /// Init
    /// - Parameters:
    ///   - text: A text to display on the button.
    ///   - icon: A icon to display on the button.
    ///   - configuration: Configuration object that required for styling of button
    ///   - state: Represents the state of the button.
    ///   - action: Action handler.
    public init(text: String,
                icon: AppButtonIcon? = nil,
                configuration: ButtonConfiguration,
                state: Binding<ButtonState>,
                action: @escaping (() -> Void)) {
        self.text = text
        self.action = action
        self.icon = icon
        self.configuration = configuration
        self._state = state
    }
    
    public var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                if let icon = icon, icon.position == .left {
                    Image(systemName: icon.name)
                }
                
                ZStack {
                    JJUIProgressIndicator(configuration: configuration.progressIndicatorConfiguration)
                        .isHidden(state != .loading, remove: true)
                        
                    Text(text)
                        .isHidden(state == .loading, remove: false)
                }

                if let icon = icon, icon.position == .right {
                    Image(systemName: icon.name)
                }
            }
        }
        .buttonStyle(ButtonConfigurationProvider(configuration: configuration, state: state))
    }
}
