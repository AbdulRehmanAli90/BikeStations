//
//  BikeStationDetailViewModel.swift
//  BikeStations
//
//  Created by Abdul Rehman on 26/05/2023.
//

import SwiftUI
import Combine
import MapKit

class BikeStationDetailViewModel: ObservableObject {
    @Published var coordinate = CLLocationCoordinate2D(latitude: 16.909132, longitude: 52.430317)
    
    func setcoordinates(with coordinates: [Double]){
        if let latitude = coordinates.first {
            self.coordinate.latitude = latitude
        }
        
        if let longitude = coordinates.last {
            self.coordinate.longitude = longitude
        }
    }
}
