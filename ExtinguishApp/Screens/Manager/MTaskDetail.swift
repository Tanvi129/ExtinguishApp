//
//  MTaskDetail.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 11/06/23.
//

import SwiftUI

struct MTaskDetail: View {
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                Image("MProfile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Stock Destroy").font(.title.bold())
                Text("XXa | Cipla").font(.title2.weight(.semibold))
                HStack(spacing : 10){
                    Text("Assigned to - Mr Vansh Agarwal").font(.title3)
                    Image(systemName: "phone.fill")
                        
                        .background( Circle().fill(Color("Primary")).frame(width: 30 , height: 30))
                }
            }.frame(maxWidth: .infinity)
                
            Divider().padding(.vertical , 10)
            ScrollView(.vertical ){
                LazyVStack(alignment : .leading, spacing: 10){
                    HStack(alignment : . center , spacing:  20){
                        Image(systemName: "clock.fill")
                        VStack(alignment : .leading){
                            Text("Sat")
                            Text("9:00 AM - 10:00 AM")
                        }
                    }
                    HStack(alignment : . center , spacing:  20){
                        Image(systemName: "mappin.and.ellipse")
                        Text("Cipla , Chennai")
                    }
                    HStack {
                        VStack(alignment : .leading){
                            Text("Contact Person Name").font(.title2.weight(.semibold))
                            Text("Tanvi Gupta").font(.title3)
                        }
                        Spacer()
                        Image(systemName: "phone.fill").frame( width : 50, height: 50)
                    }.padding()
                        .frame(maxWidth: .infinity , alignment: .leading).background(Color("Primary"))
                    .cornerRadius(15)
                    ForEach( 1...5 , id: \.self){
                        index in SubtaskView(subtaskID: "\(index)", productName: "Paracetamol", batchNumber: "12345", expiryDate: "23/06/23", boxCount: 15000, pieceCount: 500 , outer: 120)
                    }
                    
                }
                
                
                
            }
        }
        .padding(24)
    }
}



struct MTaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        MTaskDetail()
    }
}
