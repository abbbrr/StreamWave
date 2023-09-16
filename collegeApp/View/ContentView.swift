//
//  ContentView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 09.09.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                MainView()
            }else{
                HelloView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
