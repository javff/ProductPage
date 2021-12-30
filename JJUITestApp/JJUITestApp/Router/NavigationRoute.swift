//
//  NavigationRoute.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 30-12-21.
//

import SwiftUI

struct NavigationRoute: View {
    
    @ObservedObject var router: Navigator
    
    var body: some View {
        NavigationLink(
            destination: router.currentView,
            tag: router.currentViewId,
            selection: $router.destinationId) { EmptyView() }
    }
}
