//
//  ATaskSummary.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import SwiftUI

struct ATaskSummary: View {
    @State private var selection = 0
    

    var state = ["Inprogress","Upcoming","Completed"]
    
    var body: some View {
        
        NavigationStack {
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
                    LazyVStack(spacing : 20){
                        ForEach(0...10, id:\.self){
                            index in ATaskCard(company: "Cipla" , taskID: "ANAMJJJJ")
                        }
                    }
                }
                Spacer()
            }
            .padding(24)
            .navigationBarHidden(true)
        }
    }
}

struct ATaskSummary_Previews: PreviewProvider {
    static var previews: some View {
        ATaskSummary()
    }
}

struct ATaskCard: View {
    @State var company : String
    @State var taskID : String
    var body: some View {
        VStack(alignment : .center){
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


