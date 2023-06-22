//
//  MProfile.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct MProfile: View {
   
    @EnvironmentObject var network: Network
    @State var managerDetails : Manager?
    @State private var triggerNavigationPassword = false

    
    var body: some View {
        
        NavigationView {
            if(managerDetails == nil){
                ProgressView()
            }else{
                VStack(alignment: .leading) {
                    VStack{
                        Image("MProfile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        Text(managerDetails!.name).font(.title.bold())
                        Text("Male | \(managerDetails!.age)").font(.title2.weight(.semibold))
                        Text("EMP ID - \(managerDetails!.managerId)").font(.title3)

                    }.frame(maxWidth: .infinity)
                    Divider().padding(.vertical , 10)
                    VStack(spacing : 15){
                        ProfileItemCard(title: "Email ID", value: managerDetails!.email)
                        ProfileItemCard(title: "Contact Number:", value: managerDetails?.phoneNumber ?? "Not Available")
                        ProfileItemCard(title: "Residential Address", value: managerDetails!.address)
                        Button {
        //                    Task{
        //                        try await managerdetails.getRandomFood()
        //                    }
                            triggerNavigationPassword.toggle()
                            print("The name is \(managerDetails!.name)")
                        }label: {
                            HStack(){
                                Text("Change Password").font(.title2.weight(.semibold)).foregroundColor(.black)
                                Spacer()
                                
                                Image(systemName: "arrow.right").frame( width : 50, height: 50).foregroundColor(.black).font(.system(size: 25))
                                
                            }
                            .padding(8)
                            .frame(maxWidth: .infinity , alignment: .leading).background(Color("Primary"))
                            .cornerRadius(15)
                        }
                        }
                            
                    NavigationLink(destination: ChangePassword() , isActive: $triggerNavigationPassword) { EmptyView() }
                    Spacer()
                }.padding(24)
                    
            }
           
        }.onAppear{
            print("Hello appeared")

            Task{
                managerDetails = try await ManagerApi().getRandomFood(id: network.user!.id)
            }
            print(managerDetails?.name)

    }
       

    }
}

//struct MProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        MProfile()
//    }
//}
