//
//  MProfile.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct MProfile: View {
    var body: some View {
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
                ProfileItemCard(title: "Email ID", value: "MrJethalal@gmail.com")
                ProfileItemCard(title: "Contact Number:", value: "9557146955")
                ProfileItemCard(title: "Residential Address", value: "Lane No 7, D Block , Aman Vihar, Dehradun, Uttarakhand")
                
                    HStack(){
                        Text("Change Password").font(.title2.weight(.semibold))
                        Spacer()
                        Button{
                            
                        }label: {
                            Image(systemName: "arrow.right").frame( width : 50, height: 50).foregroundColor(.black).font(.system(size: 25))
                        }
                    }
                .padding(8)
                    .frame(maxWidth: .infinity , alignment: .leading).background(Color("Primary"))
                .cornerRadius(15)
            }
           
            Spacer()
        }.padding(24)
    }
}

struct MProfile_Previews: PreviewProvider {
    static var previews: some View {
        MProfile()
    }
}
