//
//  NetworkService.swift
//  MovieHubUI
//
//  Created by BS00834 on 16/5/24.
//

import Foundation


class NetworkService{
    
    
    @MainActor
      func fetchData() async throws -> [Comments] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments")!
        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

         // print(String(data: data, encoding: .utf8))
          
        guard (200...299) ~= (response as! HTTPURLResponse).statusCode else {
          throw URLError(.badServerResponse) // Throw an error for non-successful responses
        }
          
          let decodedData = try JSONDecoder().decode([Comments].self, from: data)

        return decodedData
      }
    
    @MainActor
    func fetchData<T : Codable>(from url : String) async throws -> [T]{
        guard let url = URL(string: url) else {
            print("URL not Found")
            return []
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decodedData = try JSONDecoder().decode([T].self, from: data)
        
        return decodedData
        
    }
    
    
}

