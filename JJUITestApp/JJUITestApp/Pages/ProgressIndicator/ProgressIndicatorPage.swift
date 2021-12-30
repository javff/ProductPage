//
//  ProgressIndicatorPage.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 28-12-21.
//

import SwiftUI
import JJUI

struct ProgressIndicatorPage: View {
    var body: some View {
        VStack {
            
            HStack(spacing: 20) {
                Text("Extra Large")
                JJUIProgressIndicator(
                    configuration: ProgressIndicatorConfiguration(size: .xLarge, color: .blue)
                )
            }
            
            HStack(spacing: 20) {
                Text("Large")
                JJUIProgressIndicator(
                    configuration: ProgressIndicatorConfiguration(size: .large, color: .blue)
                )
            }
            
            HStack(spacing: 20) {
                Text("Medium")
                JJUIProgressIndicator(
                    configuration: ProgressIndicatorConfiguration(size: .medium, color: .blue)
                )
            }
            
            HStack(spacing: 20) {
                Text("Small")
                JJUIProgressIndicator(
                    configuration: ProgressIndicatorConfiguration(size: .small, color: .blue)
                )
            }
            
            HStack(spacing: 20) {
                Text("Extra Small")
                JJUIProgressIndicator(
                    configuration: ProgressIndicatorConfiguration(size: .small, color: .blue)
                )
            }
        }
    }
}
