//
//  AppDelegate.swift
//  LentaApp
//
//  Created by Sultangazy Bukharbay on 7/15/20.
//  Copyright © 2020 Sultangazy Bukharbay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let api = ApiRequest()
        let repo = BooksRepository(api: api)
        let mainController = MainViewController(bookRepo: repo)
        let navigationController = UINavigationController(rootViewController: mainController)
        window?.rootViewController = navigationController
        
        return true
    }
}

