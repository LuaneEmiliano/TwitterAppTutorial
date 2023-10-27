//
//  FeedView.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/24/23.
//

import SwiftUI

struct FeedView: View {
  @ObservedObject var viewModel = FeedViewModel()
  @State private var showNewTweetView = false
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      ScrollView {
        LazyVStack {
          ForEach(viewModel.tweets) { tweet in
            TweetRowView(tweet: tweet)
              .padding()
          }
        }
      }
      Button {
        showNewTweetView.toggle()
      } label: {
        Image("Tweet")
          .resizable()
          .scaledToFit()
          .frame(width: 28, height: 28)
          .padding()
      }
      .background(Color(.systemBlue))
      .foregroundColor(.white)
      .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
      .padding()
      .fullScreenCover(isPresented: $showNewTweetView) {
        NewTweetView()
      }
    }
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  FeedView()
}
