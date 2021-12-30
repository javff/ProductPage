//
//  ButtonRoute.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 30-12-21.
//

import Foundation
import SwiftUI

struct ButtonRoute: RouteProtocol {
    var view: AnyView {
        return AnyView(ButtonsPage())
    }
    
    var id: String {
        return "buttonsPage"
    }
}
