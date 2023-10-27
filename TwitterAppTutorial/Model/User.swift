//
//  User.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/26/23.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable {
  @DocumentID var id: String?
  let username: String
  let fullName: String
  let profileImageUrl: String
  let email: String
  
  var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
}
