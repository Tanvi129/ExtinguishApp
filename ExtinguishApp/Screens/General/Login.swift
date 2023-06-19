//
//  Login.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct Login: View {
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var triggerNavigationA = false
    @State private var triggerNavigationM = false
    @EnvironmentObject var network: Network
    
    //    @FocusState private var emailFieldIsFocused: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack(){
                
                VStack(alignment: .leading){
                    Text("Kindly enter your Credentials").font(.title2.weight(.bold)).padding(.vertical , 20)
                        
                    Text("Hey there, you will have to enter the email id and passcode for verification.").fixedSize(horizontal: false, vertical: true).padding(.bottom , 20)
                }
               
               
                    
                
                
                
                TextField(
                    "E-mail ID",
                    text: $emailID
                ).multilineTextAlignment(.center)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .font(Font.system(size: 20, design: .default))
                    .padding(4)
                    .frame(width: 350 , height: 70 , alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Background"))).padding(.bottom ,10)
                //                .overlay(
                //                        RoundedRectangle(cornerRadius: 15)
                //                            .stroke(Color.black, lineWidth: 2)
                //                )
                SecureField(
                    "Password",
                    text: $password
                ).multilineTextAlignment(.center)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .font(Font.system(size: 20, design: .default))
                    .padding(4)
                    .frame(width: 350 , height: 70 , alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Background")))
                
                
                Button {
                    
                }label: {
                    Text("Forgot Password ?").hTrailing()
                }.padding(.top ,10)
                ZStack(alignment : .bottom){
                    Image("loginBackPic")
                    
                    Button{
                        print("Hello")
                        print(emailID)
                        print(password)
                        network.getUser(email: emailID, password: password)
//                        Task{
//                            await network.getUser(email: emailID, password: password)
//                            print("done")
//                        }
                        
                        
                        if(network.user?.exists == true){
                            if(network.user?.who == "A"){
                                triggerNavigationA = true
                                print(network.user?.who)
                                
                            }else if (network.user?.who == "M"){
                                triggerNavigationM = true
                                print(network.user?.who)
                            }
                        }
                    }
                    label: {
                        Text("Log In").font(.title3).foregroundColor(Color("Primary"))
                            .frame(width: 350 , height: 80).background(RoundedRectangle(cornerRadius: 15).fill(.black)).padding(.bottom,20)
                    }
                       

                                       
                    }
                }
            .padding(16)
            .navigationDestination(
                    isPresented: $triggerNavigationA) {
                        ANavigation()
                        EmptyView().hidden()
                             
                    }
                    .navigationDestination(
                        isPresented: $triggerNavigationM) {
                            MNavigation().navigationBarBackButtonHidden(true)
                            
                            EmptyView().hidden()
                                 
                        }
                
                
                
                
                
            }
        
        
                
                .navigationBarHidden(true)
        }
    }


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login() .environmentObject(Network())
    }
}

