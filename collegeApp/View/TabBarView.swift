

import SwiftUI

struct TabBarView: View {
    @Binding var email:String
    @Binding var pass:String
    @Binding var isLoggedIn: Bool
//    @StateObject var likeViewModel = LikeViewModel()
    
    var body: some View {
        TabView{
            MainView(email: $email)
                .tabItem {
                    Label("Рекомендации", systemImage: "lightbulb")
                }
            LikeView()
                .tabItem {
                    Label("Мои книги", systemImage: "book")
                }
//                .environmentObject(likeViewModel)
            
            ProfileView(email:$email, pass:$pass, isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
        }
    }
}

