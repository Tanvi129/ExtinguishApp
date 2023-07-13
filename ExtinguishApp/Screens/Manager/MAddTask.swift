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
    var body: some View {
        ScrollView(.vertical) {
            VStack{
                CustomTextFiled(label: "Task Name", value: $taskName)
                CustomTextFiled(label: "Task ID", value: $taskName)
                CustomTextFiled(label: "Distributor Name", value: $distributorName)
                CustomTextFiled(label: "Address", value: $address)
                CustomTextFiled(label: "Contact Person Name", value: $contractPersonName)
                CustomTextFiled(label: "Contact Person Number", value: $conractPersonNumber)
                VStack{
                    
                    HStack{
                        Text("Stock Details").font(.title3.weight(.semibold))
                        Spacer()
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20 , height: 20)
                            .background( Circle().fill(Color("Primary")).frame(width: 45 , height: 45))
                    }.padding(.vertical,10)
                    CustomTextFiled(label: "Batch Number", value: $taskName)
                    CustomTextFiled(label: "Product Name", value: $taskName)
                    CustomTextFiled(label: "Expiry Date", value: $taskName)
                    Text("Count").font(.title3)
                    HStack{
                        CustomTextFiled(label: "Box", value: $taskName)
                        CustomTextFiled(label: "Pieces", value: $taskName)
                        CustomTextFiled(label: "Outer", value: $taskName)
                    }
                }
                
            }.padding(24)
            .navigationTitle("Create New Task")
        }
    }
}

struct MAddTask_Previews: PreviewProvider {
    static var previews: some View {
        MAddTask()
    }
}
