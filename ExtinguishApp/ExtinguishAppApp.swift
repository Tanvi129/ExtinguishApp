//
//  ExtinguishAppApp.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import SwiftUI
import ImageKitIO

@main
struct ExtinguishAppApp: App {
    @StateObject var network: Network = Network()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
//            ContentView().environmentObject(network)
            LandingPage().environmentObject(network)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        _ = ImageKit.init(
            publicKey: "public_kihjdWkJcQHMmeUpP2E4FU/Og2Q=",
            urlEndpoint: "https://ik.imagekit.io/uxv7hoiuz",
            transformationPosition: TransformationPosition.PATH,
            authenticationEndpoint: "http://localhost:3000/auth"
            
        )
        return true
    }
}
