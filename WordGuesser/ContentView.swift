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
        var progressViewModel = ProgressViewModel()
        wordPaletteView = WordPaletteView(progressViewModel: progressViewModel)
        progressBarView  = ProgressBarVIew(progressViewModel: progressViewModel)
        definitionView = DefinitionView()
    }
    var body: some View {
        ZStack {
            Color.init(red: 0.26, green: 0.26, blue: 0.26).ignoresSafeArea()
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
            
            var matchedWord: WordEntry = WordEntry()
            var wasFound: Bool = false
            while !wasFound{
                (matchedWord, wasFound) = WordsTranslatorIntegrator.GetDefinitionsOf(words: wordPaletteView.GetPaletteWords())
                if (!wasFound){
                    wordPaletteView = WordPaletteView(progressViewModel: wordPaletteView.GetProgressViewModel())
                }
            }
            definitionView = DefinitionView(definition: matchedWord.meanings[0].definitions[0].definition)
        })
    }
}

#Preview {
    ContentView()
}
