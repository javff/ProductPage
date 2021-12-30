//
//  ContentView.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 28-12-21.
//

import SwiftUI
import JJUI

struct ContentView: View {
    
    let pages = Component.allCases
    @State var buttonState = ButtonState.idle
    @EnvironmentObject var navigator: Navigator
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing: 16) {

                NavigationRoute(navigator: navigator)
                
                ForEach(pages, id: \.self) { (component) in
                    JJUIButton(
                        text: component.name,
                        configuration: ButtonConfiguration(
                            size: .fullWidth,
                            type: .primary
                        ),
                        state: $buttonState) {
                            self.navigator.navigate(to: component)
                        }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .navigationTitle("Test App")
        }
    }
}
