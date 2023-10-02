//
//  TabBarView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 26.09.2023.
//

import SwiftUI

struct TabBarView: View {
    @Binding var email:String
    @Binding var pass:String
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        TabView{
            MainView(email: $email)
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            ProfileView(email:$email, pass:$pass, isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView(email: $email)
//    }
//}
