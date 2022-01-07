//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 07-01-22.
//

import Foundation

extension DispatchQueue {
    func delay(milisenconds: Int, closure:@escaping ()->()) {
        asyncAfter(
            deadline: .now() + .milliseconds(milisenconds),
            execute: closure
        )
    }
    
    func delay(seconds: Int, closure:@escaping ()->()) {
        asyncAfter(
            deadline: .now() + .seconds(seconds),
            execute: closure
        )
    }
}
