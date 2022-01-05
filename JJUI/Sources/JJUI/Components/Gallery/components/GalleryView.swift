//
//  SwiftUIView.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 04-01-22.
//

import SwiftUI

struct GalleryView: View {
    
    let images: [String]
    let renderContentMode: ContentMode
    
    @State var currentStep: Int = 0
    
    var body: some View {
        GeometryReader { reader in
            TabView(selection: $currentStep) {
                ForEach(0..<images.count) { index in
                    AsyncImage(
                        url: URL(string: "\(images[index])"),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: renderContentMode)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    ).tag(index)
                }
            }
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}
