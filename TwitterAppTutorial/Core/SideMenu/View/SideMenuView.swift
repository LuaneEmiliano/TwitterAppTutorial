//
//  SideMenuView.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/24/23.
//

import SwiftUI

struct SideMenuView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 32) {
      VStack(alignment: .leading) {
        Circle()
          .frame(width: 48, height: 48)
        
        VStack(alignment: .leading, spacing: 4) {
          Text("Minnie")
            .font(.headline)
          
          Text("@minnie")
            .font(.caption)
            .foregroundColor(.gray)
        }
        UserStatsView()
          .padding(.vertical)
      }
      .padding(.leading)
      
      ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
        if viewModel == .profile {
          NavigationLink {
            ProfileView()
          } label: {
            SideMenuOptionRowView(viewModel: viewModel)
          }
        } else if viewModel == .logout {
          Button {
            print("Handle logout here...")
          } label: {
            SideMenuOptionRowView(viewModel: viewModel)
          }
        } else {
          SideMenuOptionRowView(viewModel: viewModel)
        }
      }
      
      Spacer()
    }
  }
}

#Preview {
  SideMenuView()
}
