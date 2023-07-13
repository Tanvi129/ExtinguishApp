//
//  ContentView.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network : Network
    
    
    var body: some View {
       
            if (network.isLoggedIn == false) {
                    Login()
            }else{
                if(network.user?.exists == true){
                    if(network.user?.who == "A") {
                        
                        ANavigation().navigationBarBackButtonHidden(true)
                        
                    }else if (network.user?.who == "M") {
                        
                        MNavigation().navigationBarBackButtonHidden(true)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() 
    }
}
