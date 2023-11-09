//
//  ButtonStyle.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 08.11.2023.
//

import Foundation
import SwiftUI

struct WordPickerButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .padding()
            .background(Color.blue.opacity(0.5))
            .foregroundStyle(Color.white)
            .clipShape(Capsule())
            .multilineTextAlignment(.center)
            .shadow(color: Color.black, radius: 24)
    }
}
