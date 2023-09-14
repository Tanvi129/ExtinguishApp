//
//  LandingPage1.swift
//  LandingPages
//
//  Created by vansh agarwal on 12/09/23.
//

import SwiftUI

struct LandingPageItem : Hashable{
    var heading : String
    var subheading : String
    var Image : String
    var progress : Double
}

struct LandingPage: View {
    @State private var triggerNavigationMain = false
    @State var percentage : Double = 1/3
    var landingPageList = [ LandingPageItem(heading: "Extensive support for logging!", subheading: "Do it on the site, no more paperwork.", Image: "LandingImage1" , progress: 0.3 ), LandingPageItem(heading: "Easily validate the proofs!", subheading: "From the comfort of your phone.", Image: "LandingImage2", progress: 0.6),LandingPageItem(heading: "Tracking made effortless.", subheading: "Everything's in the view", Image: "LandingImage3", progress: 1)]
    var body: some View {
      
        NavigationStack {
            VStack(){
                    TabView{
                        ForEach(landingPageList, id: \.self) { item in
                            VStack{LandingPageView(item: item).onAppear{
                                percentage = item.progress
                            }
                                HStack{
                                    Rectangle().cornerRadius(15).frame(width: item.progress == 0.3 ? 30 : 10,height: 10).foregroundColor(item.progress == 0.3 ?.black : .gray)
                                    Rectangle().cornerRadius(15).frame(width: item.progress == 0.6 ? 30 : 10,height: 10)
                                        .foregroundColor(item.progress == 0.6 ?.black : .gray)
                                    Rectangle().cornerRadius(15).frame(width: item.progress == 1 ? 30 : 10,height: 10)
                                        .foregroundColor(item.progress == 1 ?.black : .gray)


                                    Spacer()
                                    
                                    CircularProgressView(progress: item.progress).padding()
                    //                        .frame(width: 50 , height: 50)
                                }
                            }
                            
                        }
                        
                        
                        
                    }.tabViewStyle(.page)
                    
                         
                    
                    Button{
                        triggerNavigationMain = true
                        
                    } label: {
                        Text("Skip")
                            .font(.title2.weight(.medium))
                            .foregroundColor(.gray)
                            .padding(.horizontal,10)
                    }.hLeading()
                    NavigationLink(destination: ContentView() , isActive: $triggerNavigationMain) { EmptyView() }
                }
            
            .padding(16)
        .background(Color("Background"))
        }.navigationBarHidden(true)
        
        
        
        
        
    }
}

struct LandingPageView: View {
    @State var item : LandingPageItem
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text(item.heading).font(.title.weight(.semibold)).padding(.bottom,10)
                Text(item.subheading)
                    .shadow(radius: 5, x: 5, y: 5)
                    .font(.title2)
            }
           
           
            
//            Spacer()
            Image( item.Image)
                .resizable()
                .frame(width: 390 , height: 390)
            
            
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
