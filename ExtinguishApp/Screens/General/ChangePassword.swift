//
//  ChangePassword.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct ChangePassword: View {
    @State private var oldPass: String = ""
    @State private var newPass: String = ""
    @State private var newConfirmPass: String = ""
    var body: some View {
        VStack(alignment: .leading , spacing: 20){
            Text("Kindly enter your Credentials").font(.title2.weight(.bold)).padding(.vertical , 20)
            TextField(
                "E-mail ID",
                text: $oldPass
            ).multilineTextAlignment(.center)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .font(Font.system(size: 20, design: .default))
                .padding(4)
                .frame(width: 350 , height: 70 , alignment: .center)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("Background")))
            SecureField(
                "New Password",
                text: $newPass
            ).multilineTextAlignment(.center)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .font(Font.system(size: 20, design: .default))
                .padding(4)
                .frame(width: 350 , height: 70 , alignment: .center)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("Background")))
            SecureField(
                "Re-enter New Password",
                text: $newConfirmPass
            ).multilineTextAlignment(.center)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .font(Font.system(size: 20, design: .default))
                .padding(4)
                .frame(width: 350 , height: 70 , alignment: .center)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("Background")))
            
            Spacer()
            Button{
                
            }label: {
                Text("Change Password").font(.title3).foregroundColor(Color("Primary"))
                    .frame(width: 350 , height: 80).background(RoundedRectangle(cornerRadius: 15).fill(.black))
            }
        }
    }
}

struct ChangePassword_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassword()
    }
}
