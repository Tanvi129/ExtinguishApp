//
//  SubtaskView.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI

struct SubtaskView : View {
    @State var subtaskID : String
    @State var productName : String
    @State var batchNumber : String
    @State var expiryDate : String
    @State var boxCount : Int
    @State var pieceCount : Int
    @State var outer : Int
    
    var body: some View {
        VStack(alignment : .leading){
            Text("Subtask \(subtaskID)").font(.title2.weight(.semibold))
            Item(title: "Product Name", value: productName)
            Item(title: "Batch Number", value: batchNumber)
            Item(title: "Expiry Date", value: expiryDate)
            Text("Count").font(.title3.weight(.semibold))
            HStack{
                Item(title: "Box", value: String(boxCount))
                Item(title: "Piece", value: String(pieceCount))
                Item(title: "Outer", value: String(outer))
            }
        }
    }
    
    
    
    
}

struct Item : View {
    @State var title : String
    @State var value : String
    var body: some View {
        VStack(alignment : .leading) {
          
                Text(title).font(.title3.weight(.semibold))
            Text(value).font(.title3)
           
        }.padding()
            .frame(maxWidth: .infinity , alignment: .leading).background(Color("Primary"))
        .cornerRadius(15)
    }
}
//struct SubtaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubtaskView()
//    }
//}
