//
//  ProgressIndicatorRoute.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 30-12-21.
//

import Foundation
import SwiftUI

struct ProgressIndicatorRoute: RouteProtocol {
    var view: AnyView {
        return AnyView(ProgressIndicatorPage())
    }
    
    var id: String {
        return "ProgressIndicator"
    }
}
