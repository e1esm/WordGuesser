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
        FetchWords()
    }
    
    init(){
        words = []
        wordsGenerator = WordsAPIntegrator()
        FetchWords()
    }

    
    
    func FetchWords(){
        
        words = wordsGenerator.FetchWord()
        
        objectWillChange.send()
    }
    
    func GetWords() -> [String]{
        var w: [String] = []
        for i in 0..<words.count{
            w.append(words[i].word)
        }
        return w
    }
    
    
    
}
