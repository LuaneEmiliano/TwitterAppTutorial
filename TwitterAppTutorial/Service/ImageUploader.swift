//
//  ImageUploader.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/25/23.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
  static func uploadImage(image: UIImage, completion: @escaping(String)-> Void) {
    //The code bellow gets the image and return the image back to us half size.
    guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
    
    let fileName = NSUUID().uuidString
    let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)" )
    
    ref.putData(imageData, metadata: nil) { _, error in
      if let error = error {
        print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
        return
      }
      ref.downloadURL { imageUrl, _ in
        guard let imageUrl = imageUrl?.absoluteString else { return }
        completion(imageUrl)
      }
    }
  }
}
