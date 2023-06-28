//
//  ATaskDetail.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct ATaskDetail: View {
    @Binding var taskDetail : TaskModel?
    @State var subtaskList : [Subtask]?
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                Image("MProfile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Stock Destroy").font(.title.bold())
                Text("\(taskDetail!.taskId) | \(taskDetail!.companyDetails.companyName)").font(.title2.weight(.semibold))
                HStack(spacing : 10){
                    Text("Assigned By - Tanvi Gupta ").font(.title3)
                    Image(systemName: "phone.fill")
                        
                        .background( Circle().fill(Color("Primary")).frame(width: 30 , height: 30))
                }
            }.frame(maxWidth: .infinity)
                
            Divider().padding(.vertical , 10)
            ScrollView(.vertical ){
                if(subtaskList == nil){
                    ProgressView()
                }else{
                    LazyVStack(alignment : .leading, spacing: 10) {
                        HStack(alignment : . center , spacing:  20){
                            Image(systemName: "clock.fill")
                            VStack(alignment : .leading){
                                Text("Sat")
                                Text("\(taskDetail!.startTime) - \(taskDetail!.endTime)")
                            }
                        }
                        HStack(alignment : . center , spacing:  20){
                            Image(systemName: "mappin.and.ellipse")
                            Text(taskDetail!.distributorDetails.distributorAddress)
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
                        ForEach( subtaskList!.indices , id: \.self){
                            index in SubtaskView(subtaskID: "\(subtaskList![index].subtaskId)", productName: subtaskList![index].stockName, batchNumber: "\(subtaskList![index].batchNo)", expiryDate: subtaskList![index].expDate, boxCount: subtaskList![index].noOfCases, pieceCount: subtaskList![index].pieces , outer: subtaskList![index].outer)
                        }
                        
                    }
                }
                
                
                
                
            }.onAppear{
                Task {
                    subtaskList = try await CommonApi().getListOfSubtask(taskId: taskDetail!.taskId)
                }
            }
        }
        .padding(24)
    }
}

//struct ATaskDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ATaskDetail()
//    }
//}
