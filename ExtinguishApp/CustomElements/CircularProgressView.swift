//
//  CircularProgressView.swift
//  LandingPages
//
//  Created by vansh agarwal on 12/09/23.
//

import SwiftUI

struct CircularProgressView: View {
    // 1
    let progress: Double
    
    var body: some View {
        ZStack {
            Image(systemName: "arrow.right").resizable()
                .frame(width: 25, height: 25).foregroundColor(.white).background(Circle().frame(width: 40,height: 40))
//                .background(Circle()
//                    .stroke(
//                        Color.gray.opacity(0.5),
//                        lineWidth: 30
//                    )
//                        .frame(width: 50,height: 50))
            Circle()
                .stroke(
                    Color.gray.opacity(0.5),
                    lineWidth: 10
                )
                .frame(width: 80,height: 80)
                   
            
            Circle()
                // 2
                .trim(from: 0, to: progress)
                .stroke(
                    Color.black,
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .frame(width: 80,height: 80)
            
            
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.3)
    }
}
