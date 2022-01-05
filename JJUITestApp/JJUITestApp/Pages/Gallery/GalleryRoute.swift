//
//  GalleryRoute.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 04-01-22.
//

import Foundation
import SwiftUI

struct GalleryRoute: RouteProtocol {
    var view: AnyView {
        return AnyView(GalleryPage())
    }
    
    var id: String {
        return "GalleryPage"
    }
}
