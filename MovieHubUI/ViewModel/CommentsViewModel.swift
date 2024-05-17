//
//  CommentsViewModel.swift
//  MovieHubUI
//
//  Created by BS00834 on 16/5/24.
//

import SwiftUI



@Observable
class CommentsViewModel{
    
    var comments : [Comments] = []
    
    var networkService : NetworkService
    
    init(networkService : NetworkService = NetworkService()){
        self.networkService = networkService
    }
    
    func fetchComments() async {
        do {
              comments = try await networkService.fetchData(from: "https://jsonplaceholder.typicode.com/posts/1/comments")
            
           // print(comments.first)
            } catch {
                print("Problem in View Model \(error.localizedDescription)")
            }
    }
    
    
}


