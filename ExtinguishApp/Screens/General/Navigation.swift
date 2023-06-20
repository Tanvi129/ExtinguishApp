//
//  Navigation.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 18/06/23.
//

import SwiftUI

struct ANavigation: View {
    var body: some View {
        TabView {
                   ATaskSummary()
                     .tabItem {
                        Image(systemName: "calendar")
                        Text("Task Summary")
                      }
        
                    AProfile()
                      .tabItem {
                         Image(systemName: "person.circle.fill")
                         Text("Profile")
                       }
                }
    }
}

struct MNavigation: View {
    @EnvironmentObject var network: Network
    var body: some View {
        TabView {
            MTaskSummary()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Task Summary")
                }
            MAuditorList()
                .tabItem {
                    Image(systemName: "figure.stand")
                    Text("HR")
                }
            MProfile()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }
    }
}

//func getManagerDetails(id : Int ) -> Manager {
//    var managerDetails : Manager
//    Task{
//        managerDetails = try await ManagerApi().getRandomFood(id: id)
//    }
//    return managerDetails
//}
