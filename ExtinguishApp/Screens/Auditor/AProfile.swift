//
//  AProfile.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct AProfile: View {
    @State private var triggerNavigationPassword = false
    var body: some View {
    
        NavigationView {
            VStack(alignment: .leading){
                    VStack{
                        Image("MProfile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        Text("Mr Vansh Agarwal").font(.title.bold())
                        Text("Male | 30").font(.title2.weight(.semibold))
                        Text("EMP ID - RA2011026010176").font(.title3)

                    }.frame(maxWidth: .infinity)
                    Divider().padding(.vertical , 10)
                    VStack(spacing : 15){
                        ProfileItemCard(title: "Managed By:", value: "Tanvi Gupta (RA2011026010175)")
                        ProfileItemCard(title: "Email ID", value: "MrJethalal@gmail.com")
                        ProfileItemCard(title: "Contact Number:", value: "9557146955")
                        ProfileItemCard(title: "Residential Address", value: "Lane No 7, D Block , Aman Vihar, Dehradun, Uttarakhand")
                        
                        Button {
                            triggerNavigationPassword.toggle()
                        }label: {
                            HStack(){
                                Text("Change Password").font(.title2.weight(.semibold)).foregroundColor(.black)
                                Spacer()
                                
                                Image(systemName: "arrow.right").frame( width : 50, height: 50).foregroundColor(.black).font(.system(size: 25))
                                
                            }
                            .padding(8)
                            .frame(maxWidth: .infinity , alignment: .leading).background(Color("Primary"))
                            .cornerRadius(15)
                        }
                    }
                NavigationLink(destination: ChangePassword() , isActive: $triggerNavigationPassword) { EmptyView() }
                    Spacer()
            }.padding(24)
        }
        
        }
    }


struct AProfile_Previews: PreviewProvider {
    static var previews: some View {
        AProfile()
    }
}
