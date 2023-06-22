//
//  MAuditorList.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct MAuditorList: View {
    @State private var searchText = ""
    @State private var triggerNavigationDetail = false
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical){
                    LazyVStack(spacing: 15) {
                        ForEach(0...10 , id: \.self){
                            index in AuditorCard(empName: "Tanvi Gupta", empId: "RA26010175").onTapGesture {
                                triggerNavigationDetail.toggle()
                            }
                        }
                    }
                }
                NavigationLink(destination: MAuditorDetail() , isActive: $triggerNavigationDetail) { EmptyView() }
            }
//            NavigationLink(destination: MAuditorDetail() , isActive: $triggerNavigationDetail) { EmptyView() }
            .padding(8)
            .navigationTitle("Your Auditors")
                .searchable(text: $searchText , prompt: "Search by name or emp id")
        }
    }
}

struct AuditorCard: View {
    @State var empName : String
    @State var empId : String
    var body: some View {
        HStack{
            Image("MProfile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            VStack(alignment : .leading){
                Text(empName).font(.title2.weight(.semibold))
                Text("Emp Id - \(empId)").font(.title3)
            }
            Button{
                
            }label: {
                Image(systemName: "arrow.right").frame( width : 50, height: 50).foregroundColor(.black).font(.system(size: 25))
            }
        }
        .padding(8)
        .background(Color("Background"))
        .cornerRadius(15)
    }
}

struct MAuditorList_Previews: PreviewProvider {
    static var previews: some View {
        MAuditorList()
    }
}
