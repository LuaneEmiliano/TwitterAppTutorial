//
//  TweetRowView.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/24/23.
//

import SwiftUI

struct TweetRowView: View {
  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .top, spacing: 12) {
        Circle()
          .frame(width: 56, height: 56)
          .foregroundColor(Color(.systemBlue))
        
        //User info & tweet caption
        VStack(alignment: .leading, spacing: 4) {
          HStack {
            Text("Minnie")
              .font(.subheadline).bold()
            Text("@MinnieMousse")
              .foregroundColor(.gray)
              .font(.caption)
            Text("2w")
              .foregroundColor(.gray)
              .font(.caption)
            
          }
          // Tweet caption
          Text("Come to Disneyland")
            .font(.subheadline)
            .multilineTextAlignment(.leading)
        }
      }
      //Action buttons
      HStack {
        Button {
          
        } label: {
          Image(systemName: "bubble.left")
            .font(.subheadline)
        }
        
        Spacer()
        
        Button {
          
        } label: {
          Image(systemName: "arrow.2.squarepath")
            .font(.subheadline)
        }
        
        Spacer()
        
        Button {
          
        } label: {
          Image(systemName: "heart")
            .font(.subheadline)
        }
        
        Spacer()
        
        Button {
          
        } label: {
          Image(systemName: "bookmark")
            .font(.subheadline)
        }
      }
      .padding()
      .foregroundColor(.gray)
      Divider()
    }
  }
}

#Preview {
  TweetRowView()
}
