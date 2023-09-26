//
//  ContentView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 09.09.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var email = ""
    @State private var pass = ""
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                TabBarView(email:$email, pass:$pass)
            }else{
                HelloView(isLoggedIn: $isLoggedIn, email: $email, pass:$pass)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
