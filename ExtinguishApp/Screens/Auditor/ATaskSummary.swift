//
//  ATaskSummary.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import SwiftUI

struct ATaskSummary: View {
    @EnvironmentObject var network: Network
    @State private var selection = 0
    @State var taskList : [TaskModel]?
    @State var upcomingTasksList : [TaskModel]?
    @State var completedTasksList : [TaskModel]?
    @State var selectedTaskDetails : TaskModel?
    var state = ["Upcoming","Completed"]
    @State private var triggerNavigationDetail = false
    var body: some View {
        
        NavigationView {
            if(taskList == nil ){
                ProgressView()
            }else{
                VStack(){
                    HStack{
                        Text("Task Summary")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
                        NavigationLink {
                            
                        } label: {
                            Image("MProfile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }

                    }
    //
                    CustomSegmentedControl(preselectedIndex: $selection, options: state).padding(.bottom , 24)
                    ScrollView(.vertical){
                        if(selection == 0){
                            LazyVStack(spacing : 20){
                                ForEach( upcomingTasksList!.indices, id:\.self){
                                    index in ATaskCard(taskDetail: upcomingTasksList![index]).onTapGesture {
                                        selectedTaskDetails = upcomingTasksList![index]
                                        triggerNavigationDetail.toggle()
                                    }
                                }
                            }
                        }else{
                            LazyVStack(spacing : 20){
                                ForEach( completedTasksList!.indices, id:\.self){
                                    index in ATaskCard(taskDetail: completedTasksList![index]).onTapGesture {
                                        selectedTaskDetails = completedTasksList![index]
                                        triggerNavigationDetail.toggle()
                                    }
                                }
                            }
                        }
                    }
                    NavigationLink(destination: ATaskDetail(taskDetail: $selectedTaskDetails) , isActive: $triggerNavigationDetail) { EmptyView() }
                    Spacer()
                }
                .padding(24)
                .navigationBarHidden(true)
            }
            
        }.onAppear{
            Task {
                taskList = try await AuditorApi().getListOfTaskUnderAuditor(id: network.user!.id)
                upcomingTasksList = taskList?.filter({$0.taskStatus == Status.inProgress })
                completedTasksList = taskList?.filter({$0.taskStatus == Status.completed})
                
            }
        }
    }
}

struct ATaskSummary_Previews: PreviewProvider {
    static var previews: some View {
        ATaskSummary()
    }
}

struct ATaskCard: View {
    @State var taskDetail : TaskModel
    var body: some View {
        VStack(alignment : .center){
            VStack(alignment : .leading){
                Text(taskDetail.companyDetails.companyName).font(.title2.bold())
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
                HStack{
                    Button{
                        
                    }label: {
                        Text("Reschedule").foregroundColor(.red)
                    }
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Completed")
                    }
                }.padding(.horizontal, 24)
                    .padding(.vertical, 8)
            } .padding()
               
        }
        .frame(maxWidth: .infinity , alignment: .leading)
        .background(Color("Background"))
        .cornerRadius(15)
        
    }
}


