//
//  CardView.swift
//  BikeStations
//
//  Created by Abdul Rehman on 25/05/2023.
//

import SwiftUI

struct CardView: View {
    let bikeStation: BikeStation
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("\(bikeStation.id) \(bikeStation.properties.label)")
                .font(.headline)
            HStack {
                Text("600m")
                Text("\(bikeStation.geometry.type)")
                    .foregroundColor(.gray)
            }
            .font(.subheadline)
            
            Divider()
                .hidden()
            
            HStack(alignment: .center, spacing: 50) {
                VStack {
                    Image(uiImage: UIImage(named: "bike")!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                    Text("Available bikes")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("\(bikeStation.properties.freeRacks)")
                        .foregroundColor(Color(UIColor(red: 128/255.0, green: 205/255.0, blue: 156/255.0, alpha: 1.0)))
                        .bold()
                        .font(.largeTitle)
                }
                VStack {
                    Image(uiImage: UIImage(named: "lock")!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                    Text("Available places")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("\(bikeStation.properties.bikeRacks)")
                        .foregroundColor(Color(UIColor(red: 128/255.0, green: 205/255.0, blue: 156/255.0, alpha: 1.0)))
                        .bold()
                        .font(.largeTitle)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
        }
        .padding([.leading, .top])
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(bikeStation: BikeStation(geometry: .init(coordinates: [0.00, 0.00], type: "AR"), id: "12345", type: "AR", properties: .init(freeRacks: "0", bikes: "52", label: "Abdu", bikeRacks: "5", updated: "")))
            .previewLayout(.sizeThatFits)
    }
}

