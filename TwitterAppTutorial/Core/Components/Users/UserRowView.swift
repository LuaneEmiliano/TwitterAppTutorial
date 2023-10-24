//
//  UserRowView.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/24/23.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
      HStack(spacing: 12) {
      Circle()
          .frame(width: 48, height: 48)
        
        VStack(alignment: .leading, spacing: 4) {
          Text("Minnnie")
            .font(.subheadline).bold()
            .foregroundColor(.black)
          Text("Minnie Mousse")
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        Spacer()
      }
      .padding(.horizontal)
      .padding(.vertical, 4)
    }
}

#Preview {
    UserRowView()
}
