//
//  ExtinguishAppApp.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import SwiftUI

@main
struct ExtinguishAppApp: App {
    @StateObject var network: Network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(network)
        }
    }
}


