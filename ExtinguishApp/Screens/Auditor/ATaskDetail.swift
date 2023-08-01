//
//  ATaskDetail.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 14/06/23.
//

import SwiftUI
import ImageKitIO
import URLImage

//extension Image {
//    func data(url: URL) -> Image {
//        if let data = try? Data(contentsOf: url),
//           let uiImage = UIImage(data: data) {
//            return Image(uiImage: uiImage)
//                .resizable()
//        }
//        return self.resizable()
//    }
//}


let urlConstructor = ImageKit.shared.url(
    urlEndpoint: "https://ik.imagekit.io/uxv7hoiuz",
    path: "default-image.jpg",
    transformationPosition: TransformationPosition.QUERY
)


//let imageURL = URL(string: ImageKit.shared.url(
//    path: "default-image.jpg",
//    transformationPosition: TransformationPosition(rawValue: "query")!)
//.height(height: 400)
//.aspectRatio(width: 3, height: 2)
//.create())
//let imageData = Data(contentsOf: imageURL!  )
//
//let image = UIImage(data: imageData  )
struct ATaskDetail: View {
    
    @Binding var taskDetail: TaskModel?
    @State var managerDetail: Manager?
    @State var subtaskList: [Subtask]?
    
    @State private var showImagePicker:Bool = false
    @State private var inputImage: UIImage?
    @State private var proofImage : Image = Image("MProfile")
    @State private var proofImagej : UIImage?
    @State private var proofList : ProofsList?
    @State private var urlResponse : String = ""

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
  
    
    private func loadImages(){
        guard let inputImage = inputImage else {return}
        proofImage = Image(uiImage: inputImage)
        proofImagej = inputImage
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
                    if let managerName = managerDetail?.name {
                        Text("Assigned By - \(managerName)").font(.title3)
                    } else {
                        Text("Assigned By - Unknown ").font(.title3)
                    }

                    Image(systemName: "phone.fill")
                        
                        .background( Circle().fill(Color("Primary")).frame(width: 30 , height: 30))
                }
            }.frame(maxWidth: .infinity)
                
            Divider().padding(.vertical , 10)
            ScrollView(.vertical ){
                if(subtaskList == nil){
                    ProgressView()
                }else{
                    LazyVStack(alignment : .leading, spacing: 10) {
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
                                Text("Company Contact Person Name").font(.title2.weight(.semibold))
                                Text("\(taskDetail!.companyDetails.salesOfficerName)").font(.title3)
                            }
                            Spacer()
                            Image(systemName: "phone.fill").frame( width : 50, height: 50)
                        }.padding()
                            .frame(maxWidth: .infinity , alignment: .leading).background(Color("Primary"))
                            .cornerRadius(15)
                        
                        HStack {
                            VStack(alignment : .leading){
                                Text("Distributor Contact Person Name").font(.title2.weight(.semibold))
                                Text("\(taskDetail!.distributorDetails.distributorName)").font(.title3)
                            }
                            Spacer()
                            Image(systemName: "phone.fill").frame( width : 50, height: 50)
                        }.padding()
                            .frame(maxWidth: .infinity , alignment: .leading).background(Color("Primary"))
                            .cornerRadius(15)
                        ForEach( subtaskList!.indices , id: \.self){
                            index in SubtaskView(subtaskID: "\(subtaskList![index].subtaskId)", productName: subtaskList![index].stockName, batchNumber: "\(subtaskList![index].batchNo)", expiryDate: subtaskList![index].expDate, boxCount: subtaskList![index].noOfCases, pieceCount: subtaskList![index].pieces , outer: subtaskList![index].outer)
                        }
//                        Button{
//                            print("selected")
//                            let image = loadImage()
//                            print(image)
//                            showImagePicker=true
//                            let uploader = ImageKit.shared.uploader()
////                            uploader.upload(file: image!, fileName: "uploaded_image.jpg") { (result) in
//                            loadImages()
//                            uploader.upload(file: proofImagej!, fileName: "uploaded_image.jpg") { (result) in
//                                switch result {
//                                case .success(let response):
//                                    // Handle successful upload
//                                    if let httpResponse = response.0 {
//                                        // Handle HTTPURLResponse
//                                        print("Upload successful with response: \(httpResponse)")
//                                    }
//                                    if let uploadResponse = response.1 {
//                                        // Handle UploadAPIResponse
//                                        print("Upload response: \(uploadResponse)")
//                                    }
//                                case .failure(let error):
//                                    // Handle upload error
//                                    print("Upload error: \(error)")
//                                }
//
//
//                            }
//
//
//
//
//                        }label:{Text("Upload Proof")}
//                            .sheet(isPresented: $showImagePicker){
//                                ImagePicker(image:$inputImage)
//                            }.onChange(of: inputImage){ _ in loadImages()}
                        Button {
                            print("selected")
                            showImagePicker = true
                        } label: {
                            HStack{
                                Image(systemName: "square.and.arrow.up").foregroundColor(.white)
                                Text("Upload Proofs").foregroundColor(.white)
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity) .background(Color("Button"))
                            .cornerRadius(15)
                        }
                        .sheet(isPresented: $showImagePicker) {
                            ImagePicker(image: $inputImage)
                        }
                        .onChange(of: inputImage) { _ in
                                loadImages()
                                
                                let uploader = ImageKit.shared.uploader()
//                            print(proofImagej)
                                 uploader.upload(file: proofImagej!, fileName: "uploaded_image.jpg") { (result) in
                                    // Handle upload result
                                    switch result {
                                    case .success(let response):
                                        if let httpResponse = response.0 {
                                            print(httpResponse)
                                            print("Upload successful with response: \(httpResponse)")
                                            
//                                             await ProofApi().postProof(auditorId: taskDetail!.auditorAssigned, urlString: httpResponse.url!.absoluteString)
                                            
                                        }
                                        if let uploadResponse = response.1 {
                                            // Handle UploadAPIResponse
                                            print("Upload response: \(uploadResponse)")
                                            
                                            urlResponse = uploadResponse.name!
                                            print(urlResponse)
                                        }
                                    case .failure(let error):
                                        // Handle upload error
                                        print("Upload error: \(error)")
                                    }
                                    
                                }
                        }
//                        ForEach( subtaskList!.indices , id: \.self){
//                            index in SubtaskView(subtaskID: "\(subtaskList![index].subtaskId)", productName: subtaskList![index].stockName, batchNumber: "\(subtaskList![index].batchNo)", expiryDate: subtaskList![index].expDate, boxCount: subtaskList![index].noOfCases, pieceCount: subtaskList![index].pieces , outer: subtaskList![index].outer)
//                        }
                        if(proofImage != Image("MProfile"))
                        { proofImage.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .onChange(of: inputImage){ _ in loadImages()}
                                }
                        
                                
//                        URLImage(URL(string:urlConstructor.create())! ) { image in
//                            image
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                        }
                    }
                    
                }
                
                
                
                
            }.onAppear{
                Task {
                    managerDetail = try await ManagerApi().getManagerDetails(id: taskDetail!.managerAssigned)
                    subtaskList = try await CommonApi().getListOfSubtask(taskId: taskDetail!.taskId!)
//                    print(taskDetail!.managerAssigned)
                    print(urlResponse)
                    if(urlResponse != "")
                    {
                        try await ProofApi().postProof(auditorId: taskDetail!.auditorAssigned, urlString: urlResponse)
                        
                    }
//
                }
            }.onChange(of: urlResponse){ _ in
                Task{
                    try await ProofApi().postProof(auditorId: taskDetail!.auditorAssigned, urlString: urlResponse)

                }
            }
        }
        .padding(24)
    }
}

//struct ATaskDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ATaskDetail()
//    }
//}
