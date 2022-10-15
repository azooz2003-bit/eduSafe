//
//  eduSafeApp.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/14/22.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct eduSafeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                let userVM = UserViewModel()
                PopUpScreen().environmentObject(userVM)
            }
            
        }
    }
}
