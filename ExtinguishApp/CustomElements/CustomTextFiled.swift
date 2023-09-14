//
//  CustomTextFiled.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 29/06/23.
//

import SwiftUI

struct CustomTextFiled: View {
    @State  var label: String
    @Binding  var value : String
    var body: some View {
        TextField(
            label   ,
            text: $value
        ).multilineTextAlignment(.center)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .font(Font.system(size: 20, design: .default))
            .padding(4)
            .frame( height: 70 , alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color("Background"))).padding(.bottom ,10)
    }
}

struct CustomTextFiledAuditor: View {
    @State  var label: String
    @Binding  var value : String
    @Binding var managerIdd : Int
    @Binding var taskIdd : Int
    @State var auditorList : [Auditor] = []
    @State var auditorIdValue:String = ""
    
    
    var body: some View {
        HStack{
            TextField(
                label   ,
                text: $auditorIdValue
            ).multilineTextAlignment(.center)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .font(Font.system(size: 20, design: .default))
                .padding(4)
                .frame( height: 70 , alignment: .center)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("Background"))).padding(.bottom ,10)
            
            VStack {
                
               
                Menu("Select Auditors") {
                    ForEach( auditorList.indices, id: \.self){
                        index in
                        Button(auditorList[index].name) {
                            auditorIdValue = auditorList[index].auditorId.codingKey.stringValue
                        }
                    
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .onAppear{
                Task{
//                    auditorList = try await ManagerApi().getListOfAuditorsUnderManger(managerId: 76543, taskId: 5)
                    
                    auditorList = try await ManagerApi().getListOfAuditorsUnderManger(managerId: managerIdd, taskId: taskIdd)
                }
            }
        }
        
    }
}


struct CustomTextFiled_Previews: PreviewProvider {
    static var previews: some View {
        // Move the @State variables outside the struct
        ContentVieww()
    }
}

struct ContentVieww: View {
    @State var managerID: Int = 76543
    @State var taskID: Int = 5
    
    var body: some View {
        // You can now access the @State variables here
        CustomTextFiledAuditor(label: "Auditor", value: .constant(""), managerIdd: $managerID, taskIdd: $taskID)
    }
}

