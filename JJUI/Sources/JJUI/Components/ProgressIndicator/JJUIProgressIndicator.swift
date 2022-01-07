//
//  JJUIProgressIndicator.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 03-12-21.
//

import SwiftUI

public struct JJUIProgressIndicator: View {
    
    private let configuration: ProgressIndicatorConfiguration
    
    public var body: some View {
        CircleProgressBar(configuration: configuration)
    }
    
    public init(configuration: ProgressIndicatorConfiguration) {
        self.configuration = configuration
    }
}

struct CircleProgressBar: View {
    @State private var animateStrokeStart = false
    @State private var animateStrokeEnd = true
    @State private var isRotating = true

    let configuration: ProgressIndicatorConfiguration
  
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: configuration.progressLineWidth)
                .foregroundColor(.clear)
            
            Circle()
                .trim(from: animateStrokeStart ? 1/3 : 1/9, to: animateStrokeEnd ? 2/5 : 1)
                .stroke(style: StrokeStyle(lineWidth: configuration.progressLineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(configuration.ringColor)
                .rotationEffect(.degrees(isRotating ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: self.isRotating)
                .animation(.linear(duration: 1).delay(0.5).repeatForever(autoreverses: true), value: self.animateStrokeStart)
                .animation(.linear(duration: 1).delay(1).repeatForever(autoreverses: true), value: self.animateStrokeEnd)
                .onAppear() {
                    self.isRotating.toggle()
                    DispatchQueue.main.delay(0.5) { self.animateStrokeStart.toggle() }
                    DispatchQueue.main.delay(1) { self.animateStrokeEnd.toggle() }
                }
        }
        .frame(width: configuration.size.width, height: configuration.size.height)
        .padding()
    }
}

struct JJUIProgressIndicator_Previews: PreviewProvider {
    static var previews: some View {
        let themeColor = ThemeColor()
        let themeFont = ThemeFont()
        let theme = ThemeConfiguration(color: themeColor, font: themeFont)
        ThemeManager.configure(theme: theme)
        return JJUIProgressIndicator(configuration: ProgressIndicatorConfiguration(size: .large, color: .brown))
    }
}
