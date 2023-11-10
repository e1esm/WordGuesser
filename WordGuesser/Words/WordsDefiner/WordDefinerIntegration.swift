//
//  WordDefiner.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 08.11.2023.
//

import Foundation



struct WordsTranslatorIntegrator{
    private static let baseURLPath: String = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    
    
    static func GetDefinitionsOf(word: String) -> WordEntry{
        var definitionResponse: [WordEntry]?
        
        var requestURL: URLRequest = URLRequest(url: URL(string: baseURLPath + word)!)
        requestURL.httpMethod = "GET"
        print("Request: \(requestURL.url?.absoluteString)")
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
                    print(String(data: data, encoding: .utf8))
                    definitionResponse = try JSONDecoder().decode([WordEntry].self, from: data)
                }catch{
                    print(error)
                }
            }
  
        }
        task.resume()
        _ = semaphore.wait(timeout: .distantFuture)
        
        if definitionResponse == nil{
            return WordEntry()
        }
        return definitionResponse![0]
    }
    
    
}
