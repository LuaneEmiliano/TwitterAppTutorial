//
//  RegistrationView.swift
//  TwitterAppTutorial
//
//  Created by luane Niejelski on 10/24/23.
//

import SwiftUI

struct RegistrationView: View {
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var viewModel: AuthViewModel
  @State var email = ""
  @State var userName = ""
  @State var fullName = ""
  @State var password = ""
  
  var body: some View {
    VStack {
      AuthenticationHeaderView(title1: "Get started.", title2: "Create your account.")
      
      VStack(spacing: 40) {
        CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
        CustomInputField(imageName: "person", placeholderText: "Username", text: $userName)
        CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullName)
        CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
      }
      .padding(32)
      
      Button {
        viewModel.register(withEmail: email,
                           password: password,
                           fullName: fullName,
                           username: userName)
        
      } label: {
        Text("Sign Up")
          .font(.headline)
          .foregroundColor(.white)
          .frame(width: 340, height: 50)
          .background(Color(.systemBlue))
          .clipShape(Capsule())
          .padding()
      }
      .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
      
      Spacer()
      
      Button {
        presentationMode.wrappedValue.dismiss()
      } label: {
        HStack {
          Text("Already have an account?")
            .font(.caption)
          
          Text("Sign In")
            .font(.caption)
            .fontWeight(.semibold)
        }
      }
      .padding(.bottom, 32)
    }
    .ignoresSafeArea()
    
  }
}

#Preview {
  RegistrationView()
}
