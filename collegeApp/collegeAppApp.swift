import SwiftUI
import Firebase
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    FirebaseApp.configure()
      

    return true

  }

}


@main
struct collegeAppApp: App {
    @StateObject var firestoreManager = CartViewModel()
    @StateObject var likeViewModel = LikeViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(firestoreManager)
                .environmentObject(likeViewModel)
        }
    }
}
