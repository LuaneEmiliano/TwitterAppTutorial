//
//  ExploreViewModel.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/26/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
  @Published var users = [User]()
  @Published var searchText = ""
  
  var searchableUsers: [User] {
    if searchText.isEmpty {
      return users
    } else {
      let lowercasedQuery = searchText.lowercased()
      
      return users.filter( {
        $0.username.contains(lowercasedQuery) ||
        $0.fullName.lowercased().contains(lowercasedQuery)
      })
    }
  }
  
  let service = UserService()
  
  init() {
    fetchUsers()
  }
  
  func fetchUsers() {
    service.fetchUsers { users in
      self.users = users
    }
  }
}
