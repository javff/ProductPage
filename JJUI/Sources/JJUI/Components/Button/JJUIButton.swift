//
//  SwiftUIView.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 01-12-21.
//

import SwiftUI

public struct JJUIButton: View {
    
    public var configuration: ButtonConfiguration
    @Binding public var state: ButtonState
    public var action: (() -> Void)
    public let text: String
    public let icon: AppButtonIcon?
    
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
            
            if let icon = icon, icon.position == .left {
                Image(systemName: icon.name)
            }
            
            ZStack {
                let loading = state == .loading
                Text(text)
                    .opacity(loading ? 0 : 1)
                
                JJUIProgressIndicator(configuration: configuration.progressIndicatorConfiguration)
                    .opacity(loading ? 1 : 0)
            }

            if let icon = icon, icon.position == .right {
                Image(systemName: icon.name)
            }
                
        }
        .buttonStyle(ButtonConfigurationProvider(configuration: configuration, state: state))
    }
}

struct JJUIButton_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        
        let themeColor = ThemeColor()
        let themeFont = ThemeFont()
        let theme = ThemeConfiguration(color: themeColor, font: themeFont)
        ThemeManager.configure(theme: theme)
        @State var buttonState = ButtonState.idle

        return Group {
            JJUIButton(
                text: "Hola que tal",
                icon: nil,
                configuration: .init(size: .large, type: .secondary),
                state: $buttonState
            ) {}    
        }
    }
}
