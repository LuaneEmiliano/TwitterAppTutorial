//
//  NewTweetView.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/24/23.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
  
  @State private var caption = ""
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var authViewModel: AuthViewModel
  @ObservedObject var viewModel = UploadTweetViewModel()
  
  var body: some View {
    VStack {
      HStack {
        Button {
          presentationMode.wrappedValue.dismiss()
        } label: {
          Text("Cancel")
            .foregroundColor(Color(.systemBlue))
        }
        Spacer()
        
        Button {
          viewModel.uploadTweet(withCaption: caption)
        } label: {
          Text("Tweet")
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
      }
      
      HStack(alignment: .top) {
        if let user = authViewModel.currentUser {
          KFImage(URL(string: user.profileImageUrl))
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 64, height: 64)
        }
        TextArea("What is happening?", text: $caption)
      }
      .padding()
    }
    .onReceive(viewModel.$didUploadTweet) { success in
      if success {
        presentationMode.wrappedValue.dismiss()
      }
    }
  }
}

#Preview {
  NewTweetView()
}
