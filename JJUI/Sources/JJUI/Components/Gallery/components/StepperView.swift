//
//  StepperView.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 04-01-22.
//

import SwiftUI

struct StepperView: View {
    
    let text: String

     var body: some View {
         Text(text)
             .padding(EdgeInsets(top: 3, leading: 6, bottom: 3, trailing: 6))
             .background(Color(hex: "#E5E5E5"))
             .cornerRadius(16)
             .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 0))
     }
}
