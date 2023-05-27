//
//  BikeStationsApp.swift
//  BikeStations
//
//  Created by Abdul Rehman on 25/05/2023.
//

import SwiftUI

@main
struct BikeStationsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                BikeStationListView()
            }
        }
    }
}
