//
//  MTaskSummary.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import SwiftUI

struct MTaskSummary: View {
    @EnvironmentObject var network: Network
    @State var taskList : [TaskModel]?

    @StateObject var appointmentViewModel: DateViewModel = DateViewModel()

    
    @State var selectedDate: Int = DateViewModel().currentDateValue()
    @State var currentDate: Date = DateViewModel().currentDay
    @State var currentDateIndex: Int = DateViewModel().currentDateValue()
    @State var datesofMonth : [Date] = DateViewModel().currentMonth
    @State var filterMode: String = "none"
    
    @State var selectedMonth = DateViewModel().currentMonthString()
    
    
    @State private var triggerNavigationDetail = false

    
    var body: some View {
        
        NavigationView {
            if(taskList == nil){
                ProgressView()
            }else{
                VStack (alignment : .leading){
                    VStack{
                        HeaderView()
                        CalenderView(selectedMonth: $selectedMonth, selectedDate: $selectedDate, datesofMonth: $datesofMonth, currentDateIndex: $currentDateIndex)
                            .padding(5)
                    }.background( Color("Primary"))
                        .roundedCorner(40, corners: [.bottomLeft, .bottomRight])
                        
                   
                    VStack{
                        HStack(alignment: .center, spacing: 10) {
                            FilterButton(text: "Completed", selected: $filterMode)
                            FilterButton(text: "Unassigned", selected: $filterMode)
                            FilterButton(text: "InProgress", selected: $filterMode)
                        }
                        
                            ScrollView(.vertical) {
                                LazyVStack(spacing: 10){
                                    ForEach(taskList!.indices, id: \.self){
                                        task in TaskCard(taskDetail: taskList![task]).onTapGesture {
                                            triggerNavigationDetail.toggle()
                                        }
                                    }
                                }.padding(.top)
                                
                            }
                       
                        
                    }
//                    .padding(16)
                    NavigationLink(destination: MTaskDetail() , isActive: $triggerNavigationDetail) { EmptyView() }


                   
                }
            }
            
        }.onAppear {
            Task{
                taskList = try await ManagerApi().getListOfTaskUnderManger(id: network.user!.id)
            }
            
        }
        
            
        
       
            
    }
}
struct HeaderView: View {
   
    var body: some View {
        HStack(spacing: 10){
          Text("Hello, Mr Jethalal")
                .font(.title.bold())
                .foregroundColor(.white)
            
            Spacer()
            
            Button {
                
            } label: {
                
                Image("MProfile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            
        }
        .frame(height: 70)
        .padding()
        .background(Color.black)
        .roundedCorner(40, corners: [.bottomLeft, .bottomRight])
       
        
        
        
    }
}

struct CalenderView: View {
    @StateObject var appointmentViewModel: DateViewModel = DateViewModel()
    @Binding var selectedMonth : String
    @Binding var selectedDate: Int
    @Binding var datesofMonth : [Date]
    @Binding var currentDateIndex: Int
    let months = ["January", "February", "March" , "April" , "May" , "June" , "July" , "August" , "September" ,"October" , "November" , "December"]
    var body: some View {
        
        VStack (alignment: .leading){
            Picker("Select Month", selection: $selectedMonth) {
                            ForEach(months, id: \.self) {
                                Text($0)
                            }
            }
            
            .pickerStyle(.menu)
            .colorMultiply(.black)
            ScrollViewReader {
                value in
                ScrollView(.horizontal) {
                    LazyHStack( spacing: 10) {
                        ForEach(datesofMonth.indices, id: \.self){ day in
                            Button {
                                self.selectedDate = day
    //                                        print("Day \(day)")
    //                                        print("selected \(currentDate)")
                                value.scrollTo(selectedDate , anchor: .leading)
                            } label: {
                                VStack {
                                    Text(appointmentViewModel.extractDate(date: datesofMonth[day], format: "dd"))
                                        .font(.title2.bold())
                                        .foregroundColor(selectedDate == day ?  .white :
                                                .black)
                                    
                                    Text(appointmentViewModel.extractDate(date: datesofMonth[day] , format: "EEE"))
                                        .font(.callout.weight(.light))
                                        .foregroundColor(selectedDate == day ? .white : .black)
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(selectedDate == day ? 1 : 0)
                                }
                                .foregroundColor(.black)
                                .frame(width: 45 ,height: 90)
                            }
                            .background(selectedDate == day ? .black : Color("Primary"))
                            .cornerRadius(30)
                        }
                    }
                   
                }.onAppear{
                    value.scrollTo(currentDateIndex , anchor: .leading)
                }.onChange(of: selectedMonth) { _ in
                    value.scrollTo(selectedDate , anchor: .leading)
                }.frame(height: 100)
            }
          
        }
    }
}

struct FilterButton: View {
    var text: String
    @Binding var selected: String
    @EnvironmentObject var network: Network
    var body: some View {
        Button(action: {
            if (selected == text) {
                selected = "none"
            } else {
                selected = text
            }
            Task {
                
            }
            print(network.user?.id)
            
        }) {
            Text(text)
                .font(.subheadline.weight(.semibold))
                .foregroundColor(selected == text ? .white : .black)
                .padding(.horizontal, 10)
                .frame(minWidth: 110, minHeight: 50)
                .background(selected == text ? .black : Color("Primary"))
                .cornerRadius(60)
        }
    }
}

struct TaskCard: View {
    @State var taskDetail : TaskModel
    var body: some View {
        HStack(spacing: 30 ){
            VStack{
                Circle()
                    .fill(taskDetail.taskStatus == Status.unassigned  ? .clear : .black)
                    .frame(width: 15, height: 15)
                    .background(
                    
                        Circle()
                            .stroke(.black,lineWidth: 1)
                            .padding(-3)
                    )
                    .scaleEffect(taskDetail.taskStatus == Status.unassigned ? 1 : 0.8)
//
                
                
                Rectangle()
                    .fill(.black)
                    .frame(width: 3)
                    
            }
            ZStack (alignment: .leading){
               
                VStack(alignment: .leading, spacing: -1.0){
                    HStack{
                        
                        Text("John Wick | \(taskDetail.companyDetails.companyName)")
                       
                    }
                    .frame(width: 200)
                    .padding(.leading, 45)
                    .padding(20).background( taskDetail.taskStatus == Status.unassigned ? .black : Color("Primary") )
                       
                    VStack(alignment: .leading){
                        Tag(isAssigned: taskDetail.taskStatus, text: "Task ID : \(taskDetail.taskId)")
                        Tag(isAssigned: taskDetail.taskStatus, text: "Completion Date : \(taskDetail.date)")
                    }
                    .frame(width: 200)
                    .padding(.leading, 45)
                    .padding(20)
                    .background(Color("Background"))
                    
                }
                Image("MProfile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.leading)
                    .padding(.bottom,40)
            }
        }
    }
    private struct Tag: View {
        var isAssigned : Status
        var text: String
        var body: some View {
            Text(text)
                .font(.caption2.weight(.semibold))
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background(isAssigned == Status.unassigned ? .black : Color("Primary") )
                .foregroundColor(isAssigned == Status.unassigned ? Color.white : Color.black)
                .cornerRadius(5)
        }
    }
}

struct MTaskSummary_Previews: PreviewProvider {
    static var previews: some View {
        MTaskSummary()
    }
}
