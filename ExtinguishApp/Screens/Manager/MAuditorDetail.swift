//
//  MAuditorDetail.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 20/06/23.
//

import SwiftUI

struct MAuditorDetail: View {
    @State private var selection = 0
    var state = ["Upcoming","Completed"]
    
    var body: some View {
        VStack(alignment: .center){
            VStack{
                Image("MProfile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Stock Destroy").font(.title.bold())
                Text("XXa | Cipla").font(.title2.weight(.semibold))
                HStack(spacing : 10){
                    Text("Assigned By - Tanvi Gupta ").font(.title3)
                    Image(systemName: "phone.fill")
                        
                        .background( Circle().fill(Color("Primary")).frame(width: 30 , height: 30))
                }
            }.frame(maxWidth: .infinity)
                
            Divider().padding(.vertical , 10)
            Text("Work Assignment").font(.title.weight(.semibold))
            CustomSegmentedControl(preselectedIndex: $selection, options: state).padding(.bottom , 24)
            ScrollView(.vertical){
                LazyVStack(spacing : 20){
                    ForEach(0...1, id:\.self){
                        index in MAssignedtoATaskCard(company: "Cipla" , taskID: "ANAMJJJJ")
                    }
                }
            }
            Spacer()
            
        }.padding(24)
    }
}

struct MAssignedtoATaskCard: View {
    @State var company : String
    @State var taskID : String
    var body: some View {
        VStack(alignment : .leading){
            VStack(alignment : .leading){
                Text(company).font(.title2.bold())
                Text("Task ID - \(taskID)")
            }
            .padding()
            .frame(maxWidth: .infinity , alignment: .leading)
            .background(Color("Primary"))
            
            VStack(alignment : .leading, spacing: 10){
                HStack(){
                    Image(systemName: "calendar")
                    Text("Tuesday, April 8")
                }
                HStack{
                    Image(systemName: "clock.fill")
                    Text("6:00 PM - 7:00 PM")
                }
                Button{
                    
                }label: {
                    Text("Verify Proofs").hCenter()
                }.padding(.horizontal, 24)
                    .padding(.vertical, 8)
                
            } .padding()
               
        }
        .frame(maxWidth: .infinity , alignment: .leading)
        .background(Color("Background"))
        .cornerRadius(15)
        
    }
}




struct MAuditorDetail_Previews: PreviewProvider {
    static var previews: some View {
        MAuditorDetail()
    }
}
