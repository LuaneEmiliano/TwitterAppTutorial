//
//  ExploreView.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/24/23.
//

import SwiftUI

struct ExploreView: View {
  
  @ObservedObject var viewModel = ExploreViewModel()

  
  var body: some View {
    VStack {
      SearchBar(text: $viewModel.searchText)
        .padding()
      
      ScrollView {
        LazyVStack {
          ForEach(viewModel.searchableUsers) { user in
            NavigationLink {
               ProfileView(user: user)
            } label: {
              UserRowView(user: user)
              
            }
          }
        }
      }
    }
    .navigationTitle("Explore")
    .navigationBarTitleDisplayMode(.inline)
  }
}


