//
//  ContentView.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
//        TabView {
//           MTaskSummary()
//             .tabItem {
//                Image(systemName: "calendar")
//                Text("Task Summary")
//              }
//            MAuditorList()
//              .tabItem {
//                 Image(systemName: "figure.stand")
//                 Text("HR")
//               }
//            MProfile()
//              .tabItem {
//                 Image(systemName: "person.circle.fill")
//                 Text("Profile")
//               }
//        }
        
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
