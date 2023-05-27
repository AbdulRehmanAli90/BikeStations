//
//  BikeStationListViewModel.swift
//  BikeStations
//
//  Created by Abdul Rehman on 25/05/2023.
//

import SwiftUI
import Combine
import CoreLocation

class BikeStationListViewModel: ObservableObject {
    private let bikeStationService = BikeStationService()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var bikeStations: [BikeStation] = []
    
    func fetchBikeStations() {
        bikeStationService.fetchBikeStations { [weak self] bikeStations in
            DispatchQueue.main.async {
                self?.bikeStations = bikeStations?.features ?? []
            }
        }
    }
}

