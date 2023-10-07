

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
                }
            LikeView(email:$email)
                .tabItem {
                    Label("Мои книги", systemImage: "book")
                }
            
            ProfileView(email:$email, pass:$pass, isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
        }
    }
}

