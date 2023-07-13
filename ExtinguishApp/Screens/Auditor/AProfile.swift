//
//  AProfile.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct AProfile: View {
    @EnvironmentObject var network: Network
    @State var auditorDetails : Auditor?
    @State private var triggerNavigationPassword = false
    var body: some View {
    
        NavigationView {
            if (auditorDetails == nil || network.isBusy == true){
                ProgressView()
            }else{
                VStack(alignment: .leading) {
                        VStack{
                            Image("MProfile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                            Text(auditorDetails!.name).font(.title.bold())
                            Text("Male | \(auditorDetails!.age)").font(.title2.weight(.semibold))
                            Text("EMP ID - \(auditorDetails!.auditorId)").font(.title3)

                        }.frame(maxWidth: .infinity)
                        Divider().padding(.vertical , 10)
                        VStack(spacing : 15){
                            ProfileItemCard(title: "Managed By:", value: "Tanvi Gupta (RA2011026010175)")
                            ProfileItemCard(title: "Email ID", value: auditorDetails!.email)
                            ProfileItemCard(title: "Contact Number:", value: auditorDetails!.phoneNumber)
                            ProfileItemCard(title: "Residential Address", value: auditorDetails!.address)
                            
                            Button {
                                triggerNavigationPassword.toggle()
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
                }
                .toolbar {
                    Button {
                        Task{
                            await network.signOut()
                        }
                        
                    } label: {
                        Image(systemName: "iphone.and.arrow.forward").resizable().frame(width : 30 , height: 30)
                    }
                }
                .padding(24)
            }
            
        }.onAppear {
            Task{
                auditorDetails = try await AuditorApi().getAuditorDetails(id: network.user!.id)
            }
        }
        
    }
    }


struct AProfile_Previews: PreviewProvider {
    static var previews: some View {
        AProfile()
    }
}
