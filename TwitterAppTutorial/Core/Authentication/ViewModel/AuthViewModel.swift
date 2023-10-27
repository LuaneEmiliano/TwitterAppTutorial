//
//  AuthViewModel.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/25/23.
//
// ViewModel responsible for Sign in, Login in
import Foundation
import Firebase
import FirebaseStorage

class AuthViewModel: ObservableObject {
  //Store the user section if the user is login   this property will have a value otherwise this property will be nil
  @Published var userSession: FirebaseAuth.User?
  @Published var didAuthUser = false
  @Published var currentUser: User?
  private var tempUserSession: FirebaseAuth.User?
  
  private let service = UserService()
  //Checking if there  is a user before it signs in
  init() {
    self.userSession = Auth.auth().currentUser
    self.fetchUser()
  }
  
  func login(withEmail email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      if let error = error {
        print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
        return
      }
      guard let user = result?.user else { return }
      self.userSession = user
      self.fetchUser()
    }
  }
  
  func register(withEmail email: String, password: String, fullName: String, username: String) {
    // Valid and handle a case that can might occur an error.
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      if let error = error {
        print("DEBUG: Failed to register with error \(error.localizedDescription)")
        return
      }
      guard let user = result?.user else { return }
      self.tempUserSession = user
      //This data dic is going to be upload to Firestore
      let data = ["email": email,
                  "username": username.lowercased(),
                  "fullName": fullName,
                  "uid": user.uid]
      
      Firestore.firestore().collection("users")
        .document(user.uid)
        .setData(data) { _  in
          self.didAuthUser = true
        }
      self.userSession = user
    }
  }
  
  func signOut() {
    //sets user session to nil so we show login view
    userSession = nil
    //signs user out on server
    try?  Auth.auth().signOut()
  }
  
  func uploadProfileImage(_ image: UIImage) {
    guard let uid = tempUserSession?.uid else { return }
    
    ImageUploader.uploadImage(image: image) { profileImageUrl in
      Firestore.firestore().collection("users")
        .document(uid)
        .updateData(["profileImageUrl": profileImageUrl]) { _ in
          self.userSession = self.tempUserSession
          self.fetchUser()
        }
    }
    didAuthUser = false
  }
  
  func fetchUser() {
    guard let uid = self.userSession?.uid else { return }
    
    service.fetchUser(withUid: uid) { user in
      self.currentUser = user
    }
  }
}
