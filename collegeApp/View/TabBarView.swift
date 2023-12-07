

import SwiftUI

struct TabBarView: View {
    @Binding var email:String
    @Binding var pass:String
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        TabView{
            MainView(email: $email)
                .tabItem {
                    Label("Рекомендации", systemImage: "lightbulb")
                        .foregroundColor(Color.red)
                }
            LikeView(email:$email)
                .tabItem {
                    Label("Избранные", systemImage: "book")
                        .foregroundColor(Color.red)
                }
            
            ProfileView(email:$email, pass:$pass, isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Профиль", systemImage: "person")
                        .foregroundColor(Color.red)
                }
        }
    }
}

