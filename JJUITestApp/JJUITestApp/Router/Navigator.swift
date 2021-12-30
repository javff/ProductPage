//
//  Navigator.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 30-12-21.
//

import Foundation
import SwiftUI

class Navigator: ObservableObject {
    
    private let router: RouterProtocol
    private var currentRoute: RouteProtocol?
    @Published var destinationId: String?
    
    var currentView: AnyView? {
        return currentRoute?.view
    }
    
    var currentViewId: String {
        return currentRoute?.id ?? ""
    }
    
    init(router: RouterProtocol) {
        self.router = router
    }

    func navigate(to component: Component) {
        guard let route = router.navigate(to: component) else { return }
        self.currentRoute = route
        self.destinationId = route.id
    }
}
