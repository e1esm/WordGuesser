//
//  ContentView.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 07.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var wordPaletteView = WordPaletteView()
    @State private var progressBarView = ProgressBarVIew()
    var body: some View {
        ZStack {
            
                Color.init(red: 249, green: 240, blue: 222)
                    .ignoresSafeArea()
            VStack(spacing: 50){
                progressBarView
                wordPaletteView
                Spacer(minLength: 200)
            }
        }

    }
}

#Preview {
    ContentView()
}
