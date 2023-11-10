//
//  WordDefinitionResponse.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 10.11.2023.
//

import Foundation



struct Definition: Codable {
    let definition: String
    let synonyms: [String]
    let antonyms: [String]
    let example: String?
}

struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
    let synonyms: [String]
    let antonyms: [String]
}

struct WordEntry: Codable {
    let word: String
    let meanings: [Meaning]
    
    
    init(){
        word = ""
        meanings = []
    }
}
