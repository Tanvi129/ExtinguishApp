//
//  MTaskSummary.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 21/05/23.
//

import SwiftUI

struct MTaskSummary: View {
    @StateObject var appointmentViewModel: DateViewModel = DateViewModel()

    
    @State var selectedDate: Int = DateViewModel().currentDateValue()
    @State var currentDate: Date = DateViewModel().currentDay
    @State var currentDateIndex: Int = DateViewModel().currentDateValue()
    @State var datesofMonth : [Date] = DateViewModel().currentMonth
    @State var filterMode: String = "none"
    
    @State var selectedMonth = DateViewModel().currentMonthString()
   
    

    
    var body: some View {
        
        VStack (alignment : .leading){
            VStack{
                HeaderView()
                CalenderView(selectedMonth: $selectedMonth, selectedDate: $selectedDate, datesofMonth: $datesofMonth, currentDateIndex: $currentDateIndex).padding(16)
            }.background( Color("Primary"))
                .roundedCorner(40, corners: [.bottomLeft, .bottomRight])
                
           
            VStack{
                
                    
                    
                
                   
                HStack(alignment: .center, spacing: 10) {
                    FilterButton(text: "OPD", selected: $filterMode)
                    FilterButton(text: "Operation", selected: $filterMode)
                    FilterButton(text: "Meeting", selected: $filterMode)
                }
                    ScrollView(.vertical) {
                        
                        
                    }
               
                
            }.padding(16)
          
           
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
        .frame(height: 80)
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
    
    var body: some View {
        Button(action: {
            if (selected == text) {
                selected = "none"
            } else {
                selected = text
            }
        }) {
            Text(text)
                .font(.subheadline.weight(.semibold))
                .foregroundColor(selected == text ? .white : .black)
                .padding(.horizontal, 20)
                .frame(minWidth: 110, minHeight: 50)
                .background(selected == text ? .black : Color("Primary"))
                .cornerRadius(60)
        }
    }
}

struct MTaskSummary_Previews: PreviewProvider {
    static var previews: some View {
        MTaskSummary()
    }
}
