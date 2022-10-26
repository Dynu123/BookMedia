//
//  BookMediaApp.swift
//  BookMedia
//
//  Created by Dyana Varghese on 19/10/22.
//

import SwiftUI
import Combine

@main
struct BookMediaApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.isAuthenticated() {
                BookListView().environmentObject(authViewModel)
            } else {
                LoginView().environmentObject(authViewModel)
            }
        }
        
    }
}
