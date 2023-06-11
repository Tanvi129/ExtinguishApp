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
            VStack{
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
//                HStack{
//                    ForEach(state.indices, id: \.self){ index in
//                        Button {
//                            selection = index
//                            print(selection)
//                        } label: {
//                            Text(state[index]).font(.title3).foregroundColor(.black)
//                        }
//
//
//                    }
//                }
//
//                .padding()
//                .background(Color("Background"))
//                .cornerRadius(100)
                CustomSegmentedControl(preselectedIndex: $selection, options: state)
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


