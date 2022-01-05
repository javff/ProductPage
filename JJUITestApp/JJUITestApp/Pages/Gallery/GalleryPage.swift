//
//  GalleryPage.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 04-01-22.
//

import SwiftUI
import JJUI

struct GalleryPage: View {
    
    @State var images: [String] = [
        "https://falabella.scene7.com/is/image/Falabella/15643402_1?wid=800&hei=800&qlt=70",
        "https://falabella.scene7.com/is/image/Falabella/15663154_1?wid=800&hei=800&qlt=70",
        "https://www.notebookcheck.org/fileadmin/Notebooks/Apple/iPhone_13_Pro/4_to_3_Teaser_Apple_iPhone_13_Pro.jpg"
    ]
    
    var body: some View {
        JJUIGallery(images: images)
    }
}
