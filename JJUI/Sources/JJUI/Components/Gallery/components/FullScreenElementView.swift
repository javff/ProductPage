//
//  FullScreenElementView.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 04-01-22.
//

import SwiftUI

struct FullScreenElementView: View {
    
    enum Constants {
        static let defaultOffsetY: CGFloat = 0
        static let defaultOpacitiy: CGFloat = 0.8
        static let velocityToClose: CGFloat = 200
    }
    
    let images: [String]
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var currentStep: Int
    
    @State private var offsetY: CGFloat = Constants.defaultOffsetY
    @State private var opacity: CGFloat = Constants.defaultOpacitiy
    
    private var stepperText: String {
        "\(currentStep + 1) / \(images.count)"
    }
    
    
    init(images: [String], currentStep: Binding<Int>) {
        self.images = images
        self._currentStep = currentStep
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                GalleryView(
                    images: images,
                    currentStep: $currentStep
                )
                    .offset(x: 0, y: offsetY)
                    .onTapGesture { }
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onChanged({ value in
                                swipeGestureChanged(value)
                            })
                            .onEnded({ value in
                                swipeGestureOnEnded(value)
                            })
                    )
                HStack {
                    //TODO: add close icon
                    Spacer()
                    StepperView(text: stepperText)
                }
                .padding(.horizontal, 10)
                .opacity(opacity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(FullScreenGaleryBackgroundView(opacity: $opacity))
    }
    
    //MARK: - functions
    
    private func swipeByClose(velocity: CGFloat) -> Bool {
        return velocity >= Constants.velocityToClose
    }
    
    private func swipeGestureChanged(_ value: DragGesture.Value) {
        let opacityCandidate = (value.translation.height * 100) / Constants.velocityToClose
        let opacitiyScale = opacityCandidate / 100
        offsetY = value.translation.height
        opacity = 1 - opacitiyScale
        
    }
    
    private func swipeGestureOnEnded(_ value:  DragGesture.Value) {
        if  swipeByClose(velocity: value.translation.height) {
            presentationMode.wrappedValue.dismiss()
        } else {
            withAnimation(.easeOut(duration: 0.2)) {
                offsetY = Constants.defaultOffsetY
                opacity = Constants.defaultOpacitiy
            }
        }
    }
}

/// This View represents background with color transparent
fileprivate struct FullScreenGaleryBackgroundView: UIViewRepresentable {
    
    @Binding var opacity: CGFloat
    
    init(opacity: Binding<CGFloat>) {
        self._opacity = opacity
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        updateView(view)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        updateView(uiView)
    }
    
    private func updateView(_ view: UIView) {
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .black.withAlphaComponent(opacity)
        }
    }
}
