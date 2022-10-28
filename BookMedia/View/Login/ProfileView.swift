//
//  TabBarView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 25/10/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @Binding var showProfile: Bool
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all).shadow(radius: 5)
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "xmark")
                        .onTapGesture {
                            showProfile = false
                        }
                }
                .padding(8)
                Image("avatar")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(8)
                Text(User.shared.email)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.primary)
                Button("Logout") {
                    authViewModel.updateValidation(success: false)
                }
                .foregroundColor(Color.theme)
                .padding(8)
            }
        }
        .frame(maxWidth: 200, maxHeight: 200)
    }
}
