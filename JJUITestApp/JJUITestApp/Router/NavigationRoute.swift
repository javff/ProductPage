//
//  NavigationRoute.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 30-12-21.
//

import SwiftUI

struct NavigationRoute: View {
    
    @ObservedObject var navigator: Navigator
    
    var body: some View {
        NavigationLink(
            destination: navigator.currentView,
            tag: navigator.currentViewId,
            selection: $navigator.destinationId) { EmptyView() }
    }
}
