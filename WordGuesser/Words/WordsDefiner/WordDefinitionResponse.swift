//
//  WordDefinitionResponse.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 10.11.2023.
//

import Foundation



struct WordDefinitionResponse: Codable{
    var word: String
    var meanings: [Meanings]
    
    
    init() {
        word = ""
        meanings = []
    }
}


struct Meanings: Codable{
    var partOfSpeech: String
    var definitions: [Definion]
}

struct Definion: Codable{
    var definition: String
}
