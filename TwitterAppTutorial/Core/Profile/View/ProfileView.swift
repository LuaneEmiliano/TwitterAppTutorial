//
//  ProfileView.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/24/23.
//

import SwiftUI

struct ProfileView: View {
  
  @State private var selectionFilter: TweetFilterViewModel = .tweets
  @Environment(\.presentationMode) var mode
  @Namespace var animation
  
  var body: some View {
    VStack(alignment: .leading) {
      headerView
      actionButtons
      userInfoDetails
      tweetFilterBar
      tweetsView
      Spacer()
    }
  }
}

#Preview {
  ProfileView()
}

extension ProfileView {
  var headerView: some View {
    ZStack(alignment: .bottomLeading) {
      Color(.systemBlue)
        .ignoresSafeArea()
      VStack {
        Button {
          mode.wrappedValue.dismiss()
        } label: {
          Image(systemName: "arrow.left")
            .resizable()
            .frame(width: 20, height: 16)
            .foregroundColor(.white)
            .offset(x: 16, y: 12)
        }
        Circle()
          .frame(width: 72, height: 72)
          .offset(x: 16, y: 24)
      }
    }
    .frame(height: 96)
  }
  
  var actionButtons: some View {
    HStack(spacing: 12) {
      Spacer()
      
      Image(systemName: "bell.badge")
        .font(.title3)
        .padding(6)
        .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
      
      Button {
        
      } label: {
        Text("Edit Profile")
          .font(.subheadline).bold()
          .frame(width: 120, height: 32)
          .foregroundStyle(.black)
          .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
      }
    }
    .padding(.trailing)
  }
  
  var userInfoDetails: some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        Text("Minnie Mousse")
          .font(.title2).bold()
        
        Image(systemName: "checkmark.seal.fill")
          .foregroundColor(Color(.systemBlue))
      }
      Text("@Minnie")
        .font(.subheadline)
        .foregroundColor(.gray)
      
      Text("Your favorite Disney character")
        .font(.subheadline)
        .padding(.vertical)
      
      HStack(spacing: 24) {
        HStack {
          Image(systemName: "mappin.and.ellipse")
          Text("Anaheim, CA")
        }
        
        HStack {
          Image(systemName: "link")
          Text("www.minnie.com")
        }
      }
      .font(.caption)
      .foregroundColor(.gray)
      
      UserStatsView()
        .padding(.vertical)
    }
    .padding(.horizontal)
  }
  var tweetFilterBar: some View {
    HStack {
      ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
        VStack {
          Text(item.title)
            .font(.subheadline)
            .fontWeight(selectionFilter == item ? .semibold : .regular)
            .foregroundColor(selectionFilter == item ? .black : .gray)
          
          if selectionFilter == item {
            Capsule()
              .foregroundColor(Color(.systemBlue))
              .frame(height: 3)
              .matchedGeometryEffect(id: "filter", in: animation)
          } else {
            Capsule()
              .foregroundColor(Color(.clear))
              .frame(height: 3)
          }
        }
        .onTapGesture {
          withAnimation(.easeInOut) {
            self.selectionFilter = item
          }
        }
      }
    }
    .overlay(Divider().offset(x: 0, y: 16))
  }
  var tweetsView: some View {
    ScrollView {
      LazyVStack {
        ForEach(0...9, id: \.self) { _ in
          TweetRowView()
            .padding()
        }
      }
    }
  }
}

