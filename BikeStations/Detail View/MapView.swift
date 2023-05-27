//
//  MapView.swift
//  BikeStations
//
//  Created by Abdul Rehman on 26/05/2023.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    var annotationTitle: String?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
        // Remove default annotations
        uiView.removeAnnotations(uiView.annotations.filter { !($0 is CustomAnnotation) })
        
        let annotation = CustomAnnotation(coordinate: coordinate, title: annotationTitle)
        uiView.addAnnotation(annotation)
    }
    
    // Custom annotation class
    class CustomAnnotation: NSObject, MKAnnotation {
        var coordinate: CLLocationCoordinate2D
        var title: String?

        init(coordinate: CLLocationCoordinate2D, title: String?) {
            self.coordinate = coordinate
            self.title = title
        }
    }
    
    // Delegate method to customize annotation view
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard annotation is CustomAnnotation else { return nil }
            
            let identifier = "CustomAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            } else {
                annotationView?.annotation = annotation
            }
            
            // Custom image for annotation view
            annotationView?.image = UIImage(named: "bike") // Replace with your own image
            // Set label
            let label = UILabel()
            label.text = annotation.title as? String
            label.font = UIFont.boldSystemFont(ofSize: 22)
            label.textAlignment = .center
            label.textColor = UIColor(red: 128/255.0, green: 205/255.0, blue: 156/255.0, alpha: 1.0)
            label.center = annotationView?.center ?? CGPoint.zero
            label.frame = CGRect(x: label.frame.origin.x, y: 20, width: 30, height: 20)
            annotationView?.addSubview(label)
            
            
            return annotationView
        }
    }
}
