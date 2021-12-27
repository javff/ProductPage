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
    @State private var spinnerStart: CGFloat = 0.0
    @State private var spinnerEndS1: CGFloat = 0.03
    @State private var rotationDegreeS1 = initialDegree

    private let rotationTime: Double = 0.75
    private let animationTime: Double = 1.4
    private let fullRotation: Angle = .degrees(360)
    private static let initialDegree: Angle = .degrees(270)
    
    let configuration: ProgressIndicatorConfiguration
  
    var body: some View {
        ZStack {
            Circle()
            //TODO: parametrizar estos valores para la version finita de CircleProgressBar //
                .stroke(lineWidth: configuration.progressLineWidth)
                .foregroundColor(.clear)
            
            Circle()
                .trim(from: spinnerStart, to: spinnerEndS1)
                .stroke(style: StrokeStyle(lineWidth: configuration.progressLineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(configuration.ringColor)
                .rotationEffect(rotationDegreeS1)
                .onAppear {
                    
                    animateSpinner(initAnimation: true)
                    Timer.scheduledTimer(withTimeInterval: animationTime, repeats: true) { (mainTimer) in
                        animateSpinner()
                    }
                }
        }
        .frame(width: configuration.size.width, height: configuration.size.height)
        .padding()
    }
    
    // MARK: Animation methods
    func animateSpinner(with duration: Double, completion: @escaping (() -> Void)) {
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            withAnimation(Animation.easeInOut(duration: rotationTime)) {
                completion()
            }
        }
    }
    
    func animateSpinner(initAnimation: Bool = false) {
        //TODO: Issue en tiempo de la animacion, despues de la primera vuelta espera un ciclo.
        let firstAnimationTime = initAnimation ? 0 : self.rotationTime
        let secondAnimationTime = initAnimation ? rotationTime : rotationTime * 2
        let lastAnimationTime = initAnimation ? rotationTime - 0.025 :  (rotationTime * 2) - 0.025
        
        animateSpinner(with: firstAnimationTime) {
            spinnerEndS1 = 0.97
        }

        animateSpinner(with: secondAnimationTime) {
            spinnerEndS1 = 0.03
        }

        animateSpinner(with: lastAnimationTime) {
            rotationDegreeS1 += fullRotation
        }
    }

}

struct JJUIProgressIndicator_Previews: PreviewProvider {
    static var previews: some View {
        let themeColor = ThemeColor()
        let themeFont = ThemeFont()
        let theme = ThemeConfiguration(color: themeColor, font: themeFont)
        ThemeManager.configure(theme: theme)
        return JJUIProgressIndicator(configuration: ProgressIndicatorConfiguration(size: .large))
    }
}
