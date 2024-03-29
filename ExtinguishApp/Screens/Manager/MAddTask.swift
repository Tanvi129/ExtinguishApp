//
//  MAddTask.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 29/06/23.
//

import SwiftUI

struct MAddTask: View {
    @EnvironmentObject var network: Network
    @Binding var managerID : Int
    @Binding var taskID : Int
    @State private var taskName: String = ""
//    @State private var taskID: String = ""
    @State private var distributorName: String = ""
    @State private var address: String = ""
    @State private var contractPersonName : String = ""
    @State private var conractPersonNumber: String = ""

    @State private var subtaskList : [SubtaskSend] = []
    @State private var showingAlert = false
    @State private var auditorAssigned:String = ""
    
    

    @State var count = 0
    var body: some View {
        ScrollView(.vertical) {
            VStack{
                CustomTextFiled(label: "Task Name", value: $taskName)
//                CustomTextFiled(label: "Task ID", value: $taskName)
                CustomTextFiled(label: "Distributor Name", value: $distributorName)
                CustomTextFiled(label: "Address", value: $address)
                CustomTextFiled(label: "Contact Person Name", value: $contractPersonName)

//                CustomTextFiled(label: "Auditor Assigned ", value: $auditorAssigned)
                CustomTextFiledAuditor(label: "Auditor", value: .constant(""), managerIdd: $managerID, taskIdd: $taskID)
                

                HStack{
                    Text("Stock Details").font(.title2.weight(.semibold))
                    Spacer()
                    Button {
                        count = count + 1

                        var subtask : SubtaskSend = SubtaskSend(stockName: "", pid: 0, batchNo: 0, mfgDate: "", expDate: "", noOfCases: 0, pieces: 0, outer: 0)
                        subtaskList.append(subtask)

                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 20 , height: 20)
                            .background( Circle().fill(Color("Primary")).frame(width: 45 , height: 45))
                    }
                    
                }.padding(.vertical,10)

                ForEach( subtaskList.indices, id: \.self){ index in
//                    CreateSubtask(count: $count, batchno: $batchno , productName: $productName, expDate: $expDate , boxCount: $boxCount , pieces: $pieces, outer: $outer, index: index)
                    CreateSubtask(count: $count, subtask: $subtaskList[index], subtaskList: $subtaskList, index: index)
                }
                Button{
                    print("Subtask", subtaskList)
                    var task = TaskModel(name: taskName, date: "2023-06-10", location: loc(latitude: 16.55, longitude: 145.66), taskStatus: Status.unassigned, auditorAssigned: Int($auditorAssigned.wrappedValue) ?? 0, managerAssigned: network.user!.id, startTime: "09:00:00", endTime: "13:30:00", distributorDetails: DistributorDetails(distributorName: distributorName, distributorContact: conractPersonNumber, distributorAddress: address), companyDetails: CompanyDetails(companyName: "Cipla", salesOfficerName: "Mr M P Gupta", salesOfficerContact: "9412436699"))
                    Task{
                        let newtaskId = try await ManagerApi().performAddRequestTask(task: task)
                        for subtask in subtaskList{
                            try await ManagerApi().performAddRequestSubtask(taskid: newtaskId, subtask: subtask)
                        }
                        showingAlert = true
                    }
                }label: {
                    HStack{                         Image(systemName: "note.text").foregroundColor(.white)

                        Text("Create Task").foregroundColor(.white)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity) .background(.black)
                    .cornerRadius(15)
                    
                   
                }.padding(.top,10)

                    .alert("Task Created Successfully", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }

                
               
             
            }.padding(24)
            .navigationTitle("Create New Task")
        }
    }
}
struct CreateSubtask: View {

    
    @Binding var count : Int
    @Binding var subtask : SubtaskSend
    @Binding var subtaskList : [SubtaskSend]
    @State var batchNo = ""
    @State var noOfCases = ""
    @State var pieces = ""
    @State var outer = ""
    @State var index : Int
    @State private var showingAlert = false
    var body: some View {
        
        VStack{
            
            HStack{
                Text("Subtask \(index)").font(.title3.weight(.semibold))

                Spacer()
                Button{
                    if(count>0){
                       count = count - 1

                        subtaskList.remove(at: index)
                        

                    }
                }label: {
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 20 , height: 3)
                        .background( Circle().fill(Color("Primary")).frame(width: 45 , height: 45))
                }
                
            }.padding(.vertical,10)

            CustomTextFiled(label: "Batch Number", value: $batchNo)
            CustomTextFiled(label: "Product Name", value: $subtask.stockName)
            CustomTextFiled(label: "Mfg Date", value: $subtask.mfgDate)
            CustomTextFiled(label: "Expiry Date", value: $subtask.expDate)
            Text("Count").font(.title3)
            HStack{
                CustomTextFiled(label: "Box", value: $noOfCases)
                CustomTextFiled(label: "Pieces", value: $pieces)
                CustomTextFiled(label: "Outer", value: $outer)
            }
            Button{
                subtask.batchNo = Int(batchNo) ?? 0
                subtask.noOfCases = Int(noOfCases) ?? 0
                subtask.pieces = Int(pieces) ?? 0
                subtask .outer = Int(outer) ?? 0
                showingAlert = true
                
            }label: {
                Text("Save").font(.title3).foregroundColor(Color("Primary"))
                    .frame(width: 100 , height: 50).background(RoundedRectangle(cornerRadius: 15).fill(Color("Button"))).padding(.bottom,20)
            } .alert("Subtask Details Saved", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            

        }
        
    }
}
struct MAddTask_Previews: PreviewProvider {
//    @State var managerID : Int = 2
//    @State var taskID : Int = 5
    static var previews: some View {
        let managerID = Binding<Int>(get: { 76543 }, set: { _ in })
        let taskID = Binding<Int>(get: { 5 }, set: { _ in })
             
             return MAddTask(managerID: managerID, taskID: taskID)
//        MAddTask(managerID: $managerID, taskID: $taskID)
    }
}
//ContentVieww
