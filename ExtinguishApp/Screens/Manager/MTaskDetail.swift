//
//  MTaskDetail.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 11/06/23.
//

import SwiftUI
import ImageKitIO
import URLImage




struct MTaskDetail: View {
    @Binding var taskDetail : TaskModel?
    @State var subtaskList : [Subtask]?
    @State  var proofList : [ProofsList]?
    @State var showProof = false
    
    
    let urlConstructor = ImageKit.shared.url(
        urlEndpoint: "https://ik.imagekit.io/uxv7hoiuz",
        path: "default-image.jpg",
        transformationPosition: TransformationPosition.QUERY
    )
    
    private func loadImage() -> UIImage? {
         guard let imageURL = URL(string: urlConstructor.create()) else {
             return nil
         }

         do {
             
             let imageData = try Data(contentsOf: imageURL)
             print(imageData)
             return UIImage(data: imageData)
         } catch {
             print("Error loading image data: \(error)")
             return nil
         }
     }
    
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                Image("MProfile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Stock Destroy").font(.title.bold())
                Text("\(taskDetail!.taskId!) | \(taskDetail!.companyDetails.companyName)").font(.title2.weight(.semibold))
                HStack(spacing : 10){
                    Text("Assigned to - Mr Vansh Agarwal").font(.title3)
                    Image(systemName: "phone.fill")
                        
                        .background( Circle().fill(Color("Primary")).frame(width: 30 , height: 30))
                }
            }.frame(maxWidth: .infinity)
                
            Divider().padding(.vertical , 10)
            ScrollView(.vertical ){
                if(subtaskList == nil || proofList == nil){
                    ProgressView()
                }else {
                    VStack(alignment : .leading, spacing: 10) {
                        HStack(alignment : . center , spacing:  20){
                            Image(systemName: "clock.fill")
                            VStack(alignment : .leading){
                                Text("Sat")
                                Text("\(taskDetail!.startTime) - \(taskDetail!.endTime)")
                            }
                        }
                        HStack(alignment : . center , spacing:  20){
                            Image(systemName: "mappin.and.ellipse")
                            Text(taskDetail!.distributorDetails.distributorAddress)
                        }
                        HStack {
                            VStack(alignment : .leading){
                                Text("Contact Person Name").font(.title2.weight(.semibold))
                                Text(taskDetail!.distributorDetails.distributorName).font(.title3)
                            }
                            Spacer()
                            Image(systemName: "phone.fill").frame( width : 50, height: 50)
                        }.padding()
                            .frame(maxWidth: .infinity , alignment: .leading).background(Color("Primary"))
                        .cornerRadius(15)
                        ForEach( subtaskList!.indices, id: \.self){
                            index in SubtaskView(subtaskID: "\(subtaskList![index].subtaskId)", productName: subtaskList![index].stockName, batchNumber: "\(subtaskList![index].batchNo)", expiryDate: subtaskList![index].expDate, boxCount: subtaskList![index].noOfCases, pieceCount: subtaskList![index].pieces , outer: subtaskList![index].outer)
                        }
                        Button{

                            showProof.toggle()
                        }label: {
                            HStack{
                                Image(systemName: "note.text").foregroundColor(.white)
                                Text(showProof == false ? "View Proofs" : "Hide Proofs").foregroundColor(.white)
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity).background(Color("Button"))
                            .cornerRadius(15)
                           
                        }.padding(.top,10)
                        if(showProof){
                            ForEach(proofList!.indices, id : \.self){
                                index in
                                ProofItemView(proofUrl: proofList![index].url)
    //                            Image(systemName: "plus")
                                
                            }
                         
                        }
                        


                        
                    }
                }
                
                
                
                
            }.onAppear{
                Task {
                    subtaskList = try await CommonApi().getListOfSubtask(taskId: taskDetail!.taskId!)
                    print("Auditor ",taskDetail!.auditorAssigned)
                    proofList = try await ProofApi().getProofsList(auditorId: taskDetail!.auditorAssigned )
                    print(proofList!.count)
                }
                
            }
        }
        .padding(24)
    }
}



//struct MTaskDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        MTaskDetail()
//    }
//}
