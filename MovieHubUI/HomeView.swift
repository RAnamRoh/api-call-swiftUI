//
//  ContentView.swift
//  MovieHubUI
//
//  Created by BS00834 on 16/5/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = CommentsViewModel()
    
    var body: some View {
        
        List {
            ForEach(viewModel.comments , id: \.id){ comment in
                
                VStack(alignment: .leading, spacing: 10){
                    Text(comment.name)
                        .font(.title2)
                        .bold()
                    Text(comment.email)
                        .font(.footnote)
                    Text("Says : \(comment.body)")
                        .font(.caption)
                }
                
                
                //Text(comment.name)
                
            }
        }
        .onAppear{
            Task{
                await viewModel.fetchComments()
            }
        }
        
        
       
        
    }
}

#Preview {
    HomeView()
}
