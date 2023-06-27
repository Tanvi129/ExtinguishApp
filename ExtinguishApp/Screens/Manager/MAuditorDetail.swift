//
//  MAuditorDetail.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 20/06/23.
//

import SwiftUI

struct MAuditorDetail: View {
    @Binding var auditorDetails : Auditor?
    @State private var selection = 0
    @State private var triggerNavigationMap = false
    @State var taskList : [TaskModel]?
    var state = ["Upcoming","Completed"]
    
    var body: some View {
       
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                    VStack {
                        Image("MProfile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        Text(auditorDetails!.name).font(.title.bold())
                        Text("Female | \(auditorDetails!.age)").font(.title2.weight(.semibold))
                        HStack(spacing : 10){
                            Text("EMP ID - \(auditorDetails!.auditorId)").font(.title3)
                            Button{
                                triggerNavigationMap.toggle()
                            }label: {
                                Image(systemName: "mappin.and.ellipse")
                            }
                            
                                
                                .background( Circle().fill(Color("Primary")).frame(width: 30 , height: 30))
                        }
                    }.frame(maxWidth: .infinity)
                        
                    Divider().padding(.vertical , 10)
                    Item(title: "Email ID", value: auditorDetails!.email)
                    Item(title: "Contact Number", value: auditorDetails!.phoneNumber)
                    Item(title: "Residential Address", value: auditorDetails!.address)
                    Text("Work Assignment").font(.title.weight(.semibold))
                    CustomSegmentedControl(preselectedIndex: $selection, options: state).padding(.bottom , 24)
                    ScrollView(.vertical){
                        if(taskList == nil){
                            ProgressView()
                        }else{
                            LazyVStack(spacing : 20){
                                ForEach(taskList!.indices, id:\.self){
                                    index in MAssignedtoATaskCard(taskDetail: taskList![index])
                                }
                            }
                        }
                        
                    }.onAppear{
                        Task{
                            taskList = try await AuditorApi().getListOfTaskUnderAuditor(id: auditorDetails!.auditorId)
                        }
                    }
                    NavigationLink(destination: MapScreen() , isActive: $triggerNavigationMap) { EmptyView() }
                    Spacer()
                    
            }.padding(24)
        }
        
    }
}

struct MAssignedtoATaskCard: View {
    @State var taskDetail : TaskModel
    
    var body: some View {
        VStack(alignment : .leading){
            VStack(alignment : .leading){
                Text(taskDetail.name).font(.title2.bold())
                Text("Task ID - \(taskDetail.taskId)")
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
                    Text("\(taskDetail.startTime) - \(taskDetail.endTime)")
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




//struct MAuditorDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        MAuditorDetail()
//    }
//}
