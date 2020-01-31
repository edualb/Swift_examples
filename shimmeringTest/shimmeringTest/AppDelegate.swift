//
//  AppDelegate.swift
//  shimmeringTest
//
//  Created by eduardo.silva on 31/01/20.
//  Copyright © 2020 eduardo.silva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewController = ShimmeringViewController()
        let navigatorViewController = UINavigationController(rootViewController: viewController)
        
        let mainWindow = UIWindow(frame: UIScreen.main.bounds)
        mainWindow.backgroundColor = .white
        mainWindow.rootViewController = navigatorViewController
        self.window = mainWindow
        self.window?.makeKeyAndVisible()
        return true
    }


}

