//
//  File.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 07-01-22.
//

import Foundation

extension DispatchQueue {
    func delay(_ delay: Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: .now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: closure
        )
    }
}
