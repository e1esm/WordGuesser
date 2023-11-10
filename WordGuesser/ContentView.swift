//
//  ContentView.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 07.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var wordPaletteView: WordPaletteView
    @State private var progressBarView: ProgressBarVIew
    @State private var definitionView: DefinitionView
    
    init(){
        wordPaletteView = WordPaletteView()
        progressBarView  = ProgressBarVIew()
        definitionView = DefinitionView()
    }
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack(spacing: UIScreen.screenHeight * 0.1){
                progressBarView
                wordPaletteView
                definitionView
        }.frame(width: UIScreen.screenWidth * 0.95,
                    height: UIScreen.screenHeight * 0.9).background(Color.white).ignoresSafeArea(.all, edges: .bottom)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 46))
            .shadow(color: Color.black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

            
        }.onAppear(perform: {
            definitionView.SetDefinition(new: wordPaletteView.GetRandomWord())
        })

    }
}

#Preview {
    ContentView()
}
