//
//  HTTPRequester.swift
//  WordGuesser
//
//  Created by Егор Михайлов on 11.11.2023.
//

import Foundation



struct HTTPRequester<T>{
    public static func SendRequest(request: URLRequest, method: String) -> [T] where [T]: Codable{
        var definitionResponse: [T]?
        var requestURL: URLRequest = request
        requestURL.httpMethod = method
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
                    definitionResponse = try JSONDecoder().decode([T].self, from: data)
                    
                }catch{
                    definitionResponse = []
                    print(error)
                }
            }
        }
        task.resume()
        _ = semaphore.wait(timeout: .distantFuture)
        
        return definitionResponse!
    }
}
