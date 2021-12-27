//
//  AppButtonIcon.swift
//  ProductPage
//
//  Created by Juan Andres Vasquez Ferrer on 30-11-21.
//

import Foundation


public struct AppButtonIcon {
    public enum Position {
        case right
        case left
    }
    
    public let position: Position
    public let name: String
    
    public init(position: Position, name: String) {
        self.position = position
        self.name = name
    }
}
