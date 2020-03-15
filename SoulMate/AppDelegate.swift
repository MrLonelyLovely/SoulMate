//
//  AppDelegate.swift
//  SoulMate
//
//  Created by Apui on 2020/3/10.
//  Copyright © 2020 陈沛. All rights reserved.
//

import UIKit
import LeanCloud

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let configuration = LCApplication.Configuration(
            customizedServers: [
                .api("https://rgtda0b8.lc-cn-n1-shared.com")
//                .engine("https://xxx.example.com"),
//                .push("https://xxx.example.com"),
//                .rtm("https://xxx.example.com")
            ]
        )
        do {
            try LCApplication.default.set(
                id: "RGTda0b89zavbH8nfI8Kvtr8-gzGzoHsz",
                key: "ornDARJFOHVXhr2EcM9D358g",
                configuration: configuration
            )
        } catch {
            fatalError("(error)")
        }

        
        LCApplication.logLevel = .all
        
        UITabBar.appearance().tintColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1.0)
//        UITabBar.appearance().barTintColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1.0)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

/* 失败的代码
    var window: UIWindow?
    
    func checkLogedinOrNot() {
        let userSessionToken:String? = UserDefaults.standard.string(forKey: "currentUserSessionToken")
        if userSessionToken != nil {
            transitiontoHome()
        } else {
            transitiontoGuidePage()
        }
    }

    func transitiontoHome() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeTabBarController = storyboard.instantiateViewController(withIdentifier: "HomeTabBarController") as! MyTabBarController
        self.window?.rootViewController = homeTabBarController
        self.window?.makeKeyAndVisible()
    }

    func transitiontoGuidePage() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let guideVC = storyboard.instantiateViewController(withIdentifier: "GuideVC") as! GuideVC
        self.window?.rootViewController = guideVC
        self.window?.makeKeyAndVisible()
    }
*/
