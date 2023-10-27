//
//  UploadTweetViewModel.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/26/23.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
  @Published var didUploadTweet = false
  let service = TweetService()
  
  func uploadTweet(withCaption caption: String) {
    service.uploadTweet(caption: caption) { success in
      if success {
        self.didUploadTweet = true 
      } else {
        
      }
    }
  }
}
