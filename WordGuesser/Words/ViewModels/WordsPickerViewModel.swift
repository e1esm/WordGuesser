//
//  WordsPickerViewModel.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 08.11.2023.
//

import Foundation


class WordsPickerViewModel: ObservableObject{
    @Published var words: [WordResponse]
    private var wordsGenerator: WordsAPIntegrator
    
    init(words: [WordResponse], generator: WordsAPIntegrator) {
        self.words = words
        wordsGenerator = generator
        GetWords()
    }
    
    init(){
        words = []
        wordsGenerator = WordsAPIntegrator()
        GetWords()
    }

    
    
    func GetWords(){
        
        words = wordsGenerator.FetchWord()
        
        objectWillChange.send()
    }
    
    
    
}
