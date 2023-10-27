//
//  TwitterAppTutorialApp.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/23/23.
//

import SwiftUI
import Firebase

@main
struct TwitterAppTutorialApp: App {
  
  @StateObject var viewModel = AuthViewModel()
  
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
      .environmentObject(viewModel)
    }
  }
}
