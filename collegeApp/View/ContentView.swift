//
//  ContentView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 09.09.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct ContentView: View {
    
    @State private var isLoggedIn = false
    @State private var email = ""
    @State private var pass = ""
    
    @EnvironmentObject var firestoreManager:CartViewModel
    @EnvironmentObject var likeViewModel: LikeViewModel
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                TabBarView(email:$email, pass:$pass, isLoggedIn: $isLoggedIn)
            }else{
                HelloView(isLoggedIn: $isLoggedIn, email: $email, pass:$pass)
            }
        }
        .onAppear{
            if let user = Auth.auth().currentUser{
                self.email = user.email ?? ""
                self.isLoggedIn = true
                
                likeViewModel.loadLikedPodcasts()
            }
        }
    }
}

