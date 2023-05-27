//
//  BikeStationService.swift
//  BikeStations
//
//  Created by Abdul Rehman on 25/05/2023.
//

import Foundation


class BikeStationService {
    func fetchBikeStations(completion: @escaping (Bikesfeatures?) -> Void) {
        guard let url = URL(string: "https://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching bike stations:", error)
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let bikeStations = try JSONDecoder().decode(Bikesfeatures.self, from: data)
                    completion(bikeStations)
                } catch {
                    print("Error decoding bike stations:", error)
                    completion(nil)
                }
            }
        }.resume()
    }
}
