//
//  collegeAppApp.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 09.09.2023.
//

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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(firestoreManager)
        }
    }
}
