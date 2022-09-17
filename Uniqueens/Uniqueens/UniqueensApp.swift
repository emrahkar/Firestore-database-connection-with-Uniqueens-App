//
//  UniqueensApp.swift
//  Uniqueens
//
//  Created by Emrah Karabulut on 20.08.2022.
//

import SwiftUI
import Firebase

@main
struct UniqueensApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var vmLogIn = LoginViewModel()
    @StateObject var vm: ProductViewModel = ProductViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vmLogIn)
                .environmentObject(vm)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}
