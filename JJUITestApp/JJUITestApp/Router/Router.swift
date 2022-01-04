//
//  Router.swift
//  JJUITestApp
//
//  Created by Juan Andres Vasquez Ferrer on 28-12-21.
//

import Foundation

class Router: RouterProtocol {

    var routeMap: [Component : RouteProtocol] {
        [
            .buttons: ButtonRoute(),
            .progressIndicator: ProgressIndicatorRoute(),
            .gallery: GalleryRoute()
        ]
    }
   
    func navigate(to component: Component) -> RouteProtocol? {
        return routeMap[component]
    }
}
