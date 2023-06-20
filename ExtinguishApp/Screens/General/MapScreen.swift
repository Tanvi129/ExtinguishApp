//
//  MapScreen.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 20/06/23.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    var body: some View {
        MapView().edgesIgnoringSafeArea(.all)
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "San Francisco"
        annotation.subtitle = "California"
        
        uiView.addAnnotation(annotation)
    }
}
