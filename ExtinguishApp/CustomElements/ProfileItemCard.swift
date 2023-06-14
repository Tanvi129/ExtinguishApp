//
//  ProfileItemCard.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct ProfileItemCard: View {
    @State var title : String
    @State var value : String
    var body: some View {
        
        VStack (alignment: .leading){
            HStack(){
                Text(title).font(.title2.weight(.semibold))
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "pencil").frame( width : 50, height: 50).foregroundColor(.black).font(.system(size: 25))
                        .frame(width: 32.0, height: 32.0)
                }
                
                
            }
            Text(value).font(.title3)
        }.padding(8)
            .frame(maxWidth: .infinity , alignment: .leading).background(Color("Primary"))
        .cornerRadius(15)
    }
}

struct ProfileItemCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileItemCard(title: "Email ID", value: "tanvigupta129@gmail.com")
    }
}
