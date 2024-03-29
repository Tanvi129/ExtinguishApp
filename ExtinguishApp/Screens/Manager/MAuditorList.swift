//
//  MAuditorList.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct MAuditorList: View {
    @EnvironmentObject var network: Network
    @State private var searchText = ""
    @State private var triggerNavigationDetail = false
    @State var auditorList : [Auditor]?
    @State var selectedAuditorDetails : Auditor?
    var body: some View {
        NavigationView{
            if (auditorList == nil){
                ProgressView()
            }else{
                VStack{
                    ScrollView(.vertical){
                        LazyVStack(spacing: 15) {
                            ForEach(auditorList!.indices , id: \.self){
                                index in AuditorCard(empName: auditorList![index].name, empId: "\(auditorList![index].auditorId)").onTapGesture {
                                    selectedAuditorDetails = auditorList![index]
                                    triggerNavigationDetail.toggle()
                                }
                            }
                        }
                    }
                    NavigationLink(destination: MAuditorDetail(auditorDetails: $selectedAuditorDetails) , isActive: $triggerNavigationDetail) { EmptyView() }
                }
                .padding(8)
                .navigationTitle("Your Auditors")
                .searchable(text: $searchText , prompt: "Search by name or emp id")
            }
            
        }.onAppear{
            Task{
                print("Task started")
                print(network.user!.id)
                auditorList = try await ManagerApi().getListOfAuditorsUnderManger(id: network.user!.id)
                print("Task ended")
            }
           
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
