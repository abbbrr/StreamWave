import SwiftUI
import Firebase
import FirebaseAuth
import SystemConfiguration


class InternetConnection{
    static func isConnected() -> Bool {
            guard let reachability = SCNetworkReachabilityCreateWithName(nil, "www.apple.com") else {
                return false
            }
 
            var flags = SCNetworkReachabilityFlags()
            SCNetworkReachabilityGetFlags(reachability, &flags)

            let isReachable = flags.contains(.reachable)
            let needsConnection = flags.contains(.connectionRequired)
            let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
            let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)

            return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
        }
}



struct ContentView: View {
    
    @State private var isLoggedIn = false
    @State private var email = ""
    @State private var pass = ""
    
    @EnvironmentObject var firestoreManager:CartViewModel
    @EnvironmentObject var likeViewModel: LikeViewModel
    
    var body: some View {
        if InternetConnection.isConnected(){
            NavigationView {
                if isLoggedIn {
                    TabBarView(email:$email, pass:$pass, isLoggedIn: $isLoggedIn)
                        .environmentObject(firestoreManager)
                        .environmentObject(likeViewModel)
                }else{
                    HelloView(isLoggedIn: $isLoggedIn, email: $email, pass:$pass, checkInternet: false)
                }
            }
            .onAppear{
                if let user = Auth.auth().currentUser{
                    self.email = user.email ?? ""
                    self.isLoggedIn = true
                    
//                    likeViewModel.loadLikedPodcasts()
                }
            }
        } else{
            NavigationView {
                if isLoggedIn {
                    TabBarView(email:$email, pass:$pass, isLoggedIn: $isLoggedIn)
                        .environmentObject(firestoreManager)
                        .environmentObject(likeViewModel)
                }else{
                    HelloView(isLoggedIn: $isLoggedIn, email: $email, pass:$pass, checkInternet: true)
                }
            }
            .onAppear{
                if let user = Auth.auth().currentUser{
                    self.email = user.email ?? ""
                    self.isLoggedIn = true
                    
                }
            }
        }
       
    }
}

