//
//  WordDefiner.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 08.11.2023.
//

import Foundation


private let baseURLPath: String = "https://api.dictionaryapi.dev/api/v2/entries/en/"



struct WordsTranslatorIntegrator{
        
    var url: URL
    init(describe: String){
        url = URL(string: baseURLPath + describe)!
    }
    
    init(){
        url = URL(string: baseURLPath)!
    }
    
    
}
