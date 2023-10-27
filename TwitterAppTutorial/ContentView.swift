//
//  ContentView.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/23/23.
//

import SwiftUI
import Kingfisher
// This is the presentation logic
struct ContentView: View {
  @State private var showMenu = false
  @EnvironmentObject var viewModel: AuthViewModel
  
  var body: some View {
    Group {
      if viewModel.userSession == nil {
        LoginView()
      } else {
        mainInterfaceView
      }
    }
    .fullScreenCover(isPresented: $viewModel.didAuthUser) {
      ProfilePhotoSelectorView()
    }
  }
}

#Preview {
  ContentView()
}

extension ContentView {
  var mainInterfaceView: some View {
    ZStack(alignment: .topLeading) {
      MainTabView()
        .navigationBarHidden(showMenu)
      
      if showMenu {
        ZStack {
          Color(.black)
            .opacity(showMenu ? 0.25 : 0.0)
        }.onTapGesture {
          withAnimation(.easeInOut) {
            showMenu = false
          }
        }
        .ignoresSafeArea()
      }
      
      SideMenuView()
        .frame(width: 300)
        .offset(x: showMenu ? 0 : -300, y: 0)
        .background(showMenu ? Color.white : Color.clear)
    }
    .navigationTitle("Home")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        if let user = viewModel.currentUser {
        Button {
          withAnimation(.easeInOut) {
            showMenu.toggle()
          }
          
        }label: {
          KFImage(URL(string: user.profileImageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: 32, height: 32)
            .clipShape(Circle())
        }
        }
      }
    }
    .onAppear {
      showMenu = false
    }
  }
}
