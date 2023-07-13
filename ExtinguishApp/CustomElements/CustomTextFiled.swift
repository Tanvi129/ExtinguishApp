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

struct CustomTextFiled_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFiled(label: "Email", value: .constant(""))
    }
}
