//
//  FeedView.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/24/23.
//

import SwiftUI

struct FeedView: View {
  
  @State private var showNewTweetView = false
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      ScrollView {
        LazyVStack {
          ForEach(0...20, id: \.self) { word in
            TweetRowView()
              .padding()
          }
        }
      }
      Button {
        print("Show new tweet view...")
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
        Text("New tweet view...")
      }
    }
  }
}

#Preview {
  FeedView()
}
