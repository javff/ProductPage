//
//  RouterProtocols.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 30-12-21.
//

import Foundation
import SwiftUI

protocol RouteProtocol {
    var id: String { get }
    var view: AnyView { get }
}

protocol RouterProtocol: AnyObject {
    func navigate(to component: Component) -> RouteProtocol?
}
