//
//  WordDefiner.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 08.11.2023.
//

import Foundation



struct WordsTranslatorIntegrator{
    private static let baseURLPath: String = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    
    
    static func GetDefinitionsOf(word: String) -> WordDefinitionResponse{
        var definitionResponse: WordDefinitionResponse?
        
        var requestURL: URLRequest = URLRequest(url: URL(string: baseURLPath + word)!)
        requestURL.httpMethod = "GET"
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            
            defer{
                semaphore.signal()
            }
            
            if let response = response as? HTTPURLResponse{
                print(response.statusCode)
            }
            if let data = data{
                do{
                    definitionResponse = try JSONDecoder().decode(WordDefinitionResponse.self, from: data)
                }catch{
                    print(error.localizedDescription)
                }
            }
  
        }
        task.resume()
        _ = semaphore.wait(timeout: .distantFuture)
        
        if definitionResponse == nil{
            return WordDefinitionResponse()
        }
        return definitionResponse!
    }
    
    
}
