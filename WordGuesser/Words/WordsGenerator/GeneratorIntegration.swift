//
//  APIIntegration.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 07.11.2023.
//

import Foundation


struct WordResponse: Codable{
    var word: String
    init(word: String) {
        self.word = word
    }
    init() {
        word = ""
    }
}

struct WordsAPIntegration{
    
    let url = URL(string: "https://random-word-api.herokuapp.com/word?number=4")
    
    
    func FetchWord() -> [WordResponse]{
        var fetchedWords: [WordResponse] = []
        var request: URLRequest = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            defer{
                semaphore.signal()
            }
            
            if let response = response as? HTTPURLResponse{
                print(response.statusCode)
            }
            if let data = data{
                var content = String(bytes: data, encoding: .utf8)
                fetchedWords = GenerateResponseWords(&content!)
            }
  
        }
        task.resume()
        _ = semaphore.wait(timeout: .distantFuture)
        
        return fetchedWords
    }
    
    
    private func GenerateResponseWords(_ response: inout String) -> [WordResponse]{
        response.remove(at: response.startIndex)
        response.remove(at: response.index(response.endIndex, offsetBy: -1))
        response = response.replacingOccurrences(of: "\"", with: "")
        let responseArr = response.split(separator: ",")
        
        var requestedWords: [WordResponse] = []
        for word in responseArr{
            requestedWords.append(WordResponse(word: word.lowercased()))
        }
        return requestedWords
    }
}
