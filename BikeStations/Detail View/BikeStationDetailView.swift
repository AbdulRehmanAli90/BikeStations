//
//  BikeStationDetailView.swift
//  BikeStations
//
//  Created by Abdul Rehman on 25/05/2023.
//

import SwiftUI
import MapKit

struct BikeStationDetailView: View {
    let bikeStation: BikeStation
    @ObservedObject private var viewModel = BikeStationDetailViewModel()
    
    var body: some View {
        VStack {
            MapView(coordinate: CLLocationCoordinate2D(latitude: bikeStation.geometry.coordinates.first!, longitude: bikeStation.geometry.coordinates.last!), annotationTitle: bikeStation.properties.freeRacks)
                        //.edgesIgnoringSafeArea(.all)
            CardView(bikeStation: bikeStation)
        }
        .onAppear {
            viewModel.setcoordinates(with: bikeStation.geometry.coordinates)
        }
    }
}

struct BikeStationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationDetailView(bikeStation: BikeStation(geometry: .init(coordinates: [51.507222, -0.1275], type: "AR"), id: "12345", type: "AR", properties: .init(freeRacks: "0", bikes: "52", label: "Abdu", bikeRacks: "5", updated: "")))
    }
}
