//
//  MUAppDelegate.swift
//
//  Created by Edgar Semko on 25/11/2019.
//  Copyright © 2019 MobileUp. All rights reserved.
//

import UIKit

import Firebase
import FirebaseMessaging

#if canImport(FirebaseMessagingService)

import FirebaseMessagingService

#endif

#if canImport(APNsService)

import APNsService

#endif

#if canImport(PushService)

import PushService

#endif

// MARK: - MUAppDelegateConfig

enum MUAppDelegateConfig {

    case apns, firebaseMessaging
}

// MARK: - MUAppDelegate

class MUAppDelegate : UIResponder, UIApplicationDelegate {

    // MARK: - Public Properties
    
    public var config : [MUAppDelegateConfig] { return [] }

    public var window: UIWindow?

    // MARK: - Override Properties

    func application(

        _ application                               : UIApplication,
        didFinishLaunchingWithOptions launchOptions : [UIApplication.LaunchOptionsKey : Any]?) -> Bool {

        #if canImport(FirebaseMessagingService)
        
        if config.contains( .firebaseMessaging) {

            FirebaseMessagingService.shared.configure()
        }
        
        #else
        
        if config.contains( .firebaseMessaging) {
            
            fatalError("not installed pod FirebaseMessagingService")
        }
        
        #endif
        
        #if canImport(APNsService)
        
        if config.contains( .apns) {

            APNsService.shared.registerForRemoteNotifications(application:application)
        }
        
        #else
        
        if config.contains( .firebaseMessaging) {
            
            fatalError("not installed pod APNsService")
        }
        
        #endif

        setup()

        return true

    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

        #if canImport(APNsService)
        
        APNsService.shared.token = deviceToken
        
        #endif
        
        #if canImport(FirebaseMessagingService)

        FirebaseMessagingService.shared.apnsToken = deviceToken
        
        #endif
    }

    func application(

        _ application                            : UIApplication,
        didReceiveRemoteNotification userInfo    : [AnyHashable     : Any],
        fetchCompletionHandler completionHandler : @escaping (UIBackgroundFetchResult) -> Void) {

        print("didReceiveRemoteNotification - \(userInfo)")
        
        #if canImport(PushService)

        PushService.shared.action(from: userInfo)

        PushService.shared.postAPNsNotification()
        
        #endif
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {

        print("didReceiveRemoteNotification - \(userInfo)")
    }

    func application(
        _ application                         : UIApplication,
        handleActionWithIdentifier identifier : String?,
        forRemoteNotification userInfo        : [AnyHashable : Any],
        completionHandler                     : @escaping () -> Void) {

        print("handleActionWithIdentifier - \(userInfo)")
    }

    func application(
        _ application                         : UIApplication,
        handleActionWithIdentifier identifier : String?,
        forRemoteNotification userInfo        : [AnyHashable : Any],
        withResponseInfo responseInfo         : [AnyHashable : Any],
        completionHandler                     : @escaping () -> Void) {

        print("handleActionWithIdentifier - \(userInfo)")
    }

//    func applicationDidBecomeActive(_ application: UIApplication) {
//
//        NotificationCenter.default.post(name: .appDidBecomeActive, object: nil)
//    }
//
//    func applicationWillResignActive(_ application: UIApplication) {
//
//        NotificationCenter.default.post(name: .appWillResignActive, object: nil)
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//
//        NotificationCenter.default.post(name: .appDidEnterBackground, object: nil)
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//
//        NotificationCenter.default.post(name: .appWillEnterBackground, object: nil)
//    }

    func applicationWillTerminate(_ application: UIApplication) { }

    // MARK: - Public Methods

    func setup() {

    }

}
