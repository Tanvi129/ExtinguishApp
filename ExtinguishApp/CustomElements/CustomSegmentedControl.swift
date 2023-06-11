//
//  CustomSegmentedControl.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 11/06/23.
//

import SwiftUI

struct CustomSegmentedControl: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    let color = Color.black
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                
                    Rectangle()
                        .fill(color)
                        .cornerRadius(100)
                        .padding(2)
                        .opacity(preselectedIndex == index ? 1 : 0.01)
                        .onTapGesture {
                                withAnimation(.interactiveSpring()) {
                                    preselectedIndex = index
                                }
                            }
                
                .overlay(
                    Text(options[index]).foregroundColor(preselectedIndex == index ? .white : .black)
                )
            }
        }
        .frame(height: 50)
        .background(Color("Background"))
        .cornerRadius(100)
    }
}

//struct CustomSegmentedControl_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSegmentedControl(preselectedIndex: Binding<Int>, options: [String])
//    }
//}
