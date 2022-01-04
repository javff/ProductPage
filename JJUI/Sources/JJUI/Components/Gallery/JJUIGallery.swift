//
//  JJUIGallery.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 03-01-22.
//

import SwiftUI

public struct JJUIGallery: View {
    
    private struct ScrollOffsetPreferenceKey: PreferenceKey {
        static var defaultValue: CGPoint = .zero
        
        static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
    }
    
    public init() {}
    
    let images = [
        "https://www.notebookcheck.org/fileadmin/Notebooks/Apple/iPhone_13_Pro/4_to_3_Teaser_Apple_iPhone_13_Pro.jpg",
        "https://falabella.scene7.com/is/image/Falabella/15643402_1?wid=800&hei=800&qlt=70",
        "https://images.jumpseller.com/store/blackpinkphone/12349940/iphone-13-pro-max-silver-select.png?1638127224"
    ]
    
    var stepperText: String {
        "\(currentStep) / \(totalSteps)"
    }
    
    var currentStep: Int {
        1
    }
    
    var totalSteps: Int {
        images.count
    }
    
    @State var position: CGFloat = 0 {
        didSet {
            print(position)
        }
    }
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            GeometryReader { reader in
                
                Color.clear.preference(
                    key: ScrollOffsetPreferenceKey.self,
                    value: reader.frame(in: .named("scrollView")).origin
                )
                
                LazyHStack {
                    TabView {
                        ForEach(images, id: \.self) {
                            AsyncImage(
                                url: URL(string: $0),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                        }
                    }
                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
            .coordinateSpace(name: "scrollView")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: { value in
                print(value)
            })

            
            Text(stepperText)
                .padding(EdgeInsets(top: 3, leading: 6, bottom: 3, trailing: 6))
                .background(Color(hex: "#E5E5E5"))
                .cornerRadius(16)
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 0))
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .padding()
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        JJUIGallery()
    }
}
