//
//  AppDelegate.swift
//  TabBarControlTest
//
//  Created by VAM TEAM on 15/1/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let settingPage = CommonSetting()
        settingPage.tabBarItem.image = UIImage(named: "weixin")?.withRenderingMode(.alwaysOriginal)
        settingPage.tabBarItem.selectedImage = UIImage(named: "selectWeixin")?.withRenderingMode(.alwaysOriginal)
        settingPage.title = NSLocalizedString("tabBar1", comment: "")
        settingPage.tabBarItem.badgeValue = "5"
        
        let secondPage = SecondViewController()
        secondPage.tabBarItem.image = UIImage(named: "Find")?.withRenderingMode(.alwaysOriginal)
        secondPage.title = NSLocalizedString("tabBar2", comment: "")
        
        let navigationContro1 = UINavigationController(rootViewController: settingPage)
        let navigationContro2 = UINavigationController(rootViewController: secondPage)
        
        let tabBarControl = UITabBarController()
        
        //tabBarControl.tabBar.tintColor = UIColor.init(displayP3Red: 9/255.0, green: 187/255.0, blue: 7/255.0, alpha: 1)
        
        
        
        tabBarControl.viewControllers = [navigationContro1, navigationContro2]
        
        window?.backgroundColor = UIColor.white
        window?.rootViewController = tabBarControl
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

