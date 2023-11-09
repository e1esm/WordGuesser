//
//  ProgressBar.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 07.11.2023.
//

import Foundation
import SwiftUI


struct GaugeProgressStyle: ProgressViewStyle{
    var strokeColor: Color
    var strokeWidth: Double
    
    init(color: Color, width: Double){
        strokeWidth = width
        strokeColor = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        return ZStack{
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor,style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(color: Color.black, radius: 25)
        }
    }
}
