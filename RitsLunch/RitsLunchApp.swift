//
//  RitsLunchApp.swift
//  RitsLunch
//
//  Created by Yuuki Yamaguchi on 2022/11/21.
//

import SwiftUI

@main
struct RitsLunchApp: App {
   
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
class AppDelegate : UIResponder, UIApplicationDelegate {
    @ObservedObject var searcher = YoutubeSearcher()
    func application(_application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        self.searcher.search()
        
        return true
    }
}
