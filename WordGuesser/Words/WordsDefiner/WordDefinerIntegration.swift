//
//  WordDefiner.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 08.11.2023.
//

import Foundation



struct WordsTranslatorIntegrator{
    private static let baseURLPath: String = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    
    
    static func GetDefinitionsOf(words: [String]) -> (WordEntry, Bool){
        var definitions: [String: WordEntry] = [:]
        for i in 0..<words.count{
            let definition = HTTPRequester<WordEntry?>.SendRequest(request: URLRequest(url: URL(string: baseURLPath + words[i])!), method: "GET")
            
            if (definition.count != 0){
                definitions[words[i]] = definition[0]
            }
        }
  
        var chosenWord = ""
        var i = 0
        while(chosenWord == ""){
            chosenWord = (definitions.keys.randomElement()) ?? ""
            i += 1
            if (i == words.count && chosenWord == ""){
                return (WordEntry(), false)
            }
        }
        print(definitions[chosenWord]!.word)
        UserDefaults.standard.setValue(definitions[chosenWord]!.word, forKey: "curr_word")
        return (definitions[chosenWord]!, true)
    }
}
