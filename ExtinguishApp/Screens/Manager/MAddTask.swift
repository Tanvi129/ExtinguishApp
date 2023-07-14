//
//  MAddTask.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 29/06/23.
//

import SwiftUI

struct MAddTask: View {
    @State private var taskName: String = ""
    @State private var taskID: String = ""
    @State private var distributorName: String = ""
    @State private var address: String = ""
    @State private var contractPersonName : String = ""
    @State private var conractPersonNumber: String = ""
    @State private var subtaskList : [Subtask?] = []
    @State var count = 1
    var body: some View {
        ScrollView(.vertical) {
            VStack{
                CustomTextFiled(label: "Task Name", value: $taskName)
                CustomTextFiled(label: "Task ID", value: $taskName)
                CustomTextFiled(label: "Distributor Name", value: $distributorName)
                CustomTextFiled(label: "Address", value: $address)
                CustomTextFiled(label: "Contact Person Name", value: $contractPersonName)
                CustomTextFiled(label: "Contact Person Number", value: $conractPersonNumber)
                HStack{
                    Text("Stock Details").font(.title2.weight(.semibold))
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 20 , height: 20)
                            .background( Circle().fill(Color("Primary")).frame(width: 45 , height: 45))
                    }
                    
                }.padding(.vertical,10)
                
                CreateSubtask(val: $taskName)
             
            }.padding(24)
            .navigationTitle("Create New Task")
        }
    }
}
struct CreateSubtask: View {
    @Binding var val : String
    var body: some View {
        VStack{
            
            HStack{
                Text("Subtask 1").font(.title3.weight(.semibold))
                Spacer()
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 20 , height: 3)
                    .background( Circle().fill(Color("Primary")).frame(width: 45 , height: 45))
            }.padding(.vertical,10)
            CustomTextFiled(label: "Batch Number", value: $val)
            CustomTextFiled(label: "Product Name", value: $val)
            CustomTextFiled(label: "Expiry Date", value: $val)
            Text("Count").font(.title3)
            HStack{
                CustomTextFiled(label: "Box", value: $val)
                CustomTextFiled(label: "Pieces", value: $val)
                CustomTextFiled(label: "Outer", value: $val)
            }
        }
        
    }
}
struct MAddTask_Previews: PreviewProvider {
    static var previews: some View {
        MAddTask()
    }
}
