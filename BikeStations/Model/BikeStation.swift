//
//  BikeStation.swift
//  BikeStations
//
//  Created by Abdul Rehman on 25/05/2023.
//

import Foundation

struct Bikesfeatures: Codable {
    let features: [BikeStation]?
}

struct BikeStation: Codable, Identifiable {
    struct Geometry: Codable {
        let coordinates: [Double]
        let type: String
    }
    
    struct Properties: Codable {
        let freeRacks: String
        let bikes: String
        let label: String
        let bikeRacks: String
        let updated: String
        
        enum CodingKeys: String, CodingKey {
            case freeRacks = "free_racks"
            case bikes
            case label
            case bikeRacks = "bike_racks"
            case updated
        }
    }
    
    let geometry: Geometry
    let id: String
    let type: String
    let properties: Properties
}

