//
//  ProgressBarVIew.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 09.11.2023.
//

import Foundation
import SwiftUI

struct ProgressBarVIew: View{
    
    @ObservedObject var progressViewModel: ProgressViewModel
    
    init(progressViewModel: ProgressViewModel){
        self.progressViewModel = progressViewModel
    }
    
    private var total = 100.0
    var body: some View {
        VStack(alignment: .center, spacing: 25){
            GeometryReader{ reader in
                ZStack{
                    RoundedRectangle(cornerRadius: 24, style: .circular)
                        .foregroundStyle(Color.init(red: 0.26, green: 0.26, blue: 0.26))
                        .frame(width: reader.size.width,
                               height: reader.size.height)
                        .shadow(radius: 40)
                    ProgressView(value: total, total: total)
                        .progressViewStyle(GaugeProgressStyle(color: Color.gray.opacity(0.15), width: 20))
                        .contentShape(Rectangle())
                        .frame(width: reader.size.width * 0.45)
                    Text(String(progressViewModel.GetProgress()) + " / " + String(Int(total)))
                        .foregroundStyle(.white)
                    ProgressView(value: Double(progressViewModel.GetProgress()), total: total)
                        .progressViewStyle(GaugeProgressStyle(color: Color.blue.opacity(0.5), width: 20))
                        .frame(width: reader.size.width * 0.45)
                        .contentShape(Rectangle())
                }.frame(alignment: .center)
                
            }       .frame(minWidth: UIScreen.screenWidth * 0.8,
                           maxWidth: UIScreen.screenWidth * 0.85,
                           minHeight: UIScreen.screenHeight * 0.25,
                           maxHeight: UIScreen.screenHeight * 0.25)
        }
    }
}
