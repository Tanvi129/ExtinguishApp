//
//  ProofImages.swift
//  ExtinguishApp
//
//  Created by Thrishalini on 20/07/23.
//

import SwiftUI
import URLImage
import ImageKitIO

struct ProofItemView: View {
    let proofUrl: String

    var body: some View {
        let urlPath = proofUrl
       
//        let construction = ImageKit.shared.url(
//            urlEndpoint: "https://ik.imagekit.io/uxv7hoiuz",
//            path: urlPath,
//            transformationPosition: TransformationPosition.QUERY
//        )
//
//       URLImage(URL(string: construction.create())!) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            }
        PImage(urlGiven:urlPath)
        
    }
}



struct PImage : View {
    @State var urlGiven : String
    
  
    var body: some View {
        let construction = ImageKit.shared.url(
            urlEndpoint: "https://ik.imagekit.io/uxv7hoiuz",
            path: urlGiven,
            transformationPosition: TransformationPosition.QUERY
        )
        VStack(alignment : .leading) {
            URLImage(URL(string: construction.create())!) { image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                 }
           
        }.padding()
    }
}


