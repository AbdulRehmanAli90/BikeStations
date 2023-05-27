//
//  BikeStationListView.swift
//  BikeStations
//
//  Created by Abdul Rehman on 25/05/2023.
//

import SwiftUI
import Introspect

struct BikeStationListView: View {
    @ObservedObject private var viewModel = BikeStationListViewModel()
    
    var body: some View {
        
        List {
            ForEach(viewModel.bikeStations) { bikeStation in
                ZStack(alignment: .leading) {
                    NavigationLink (destination: BikeStationDetailView(bikeStation: bikeStation)) {
                        EmptyView()
                    }
                    .opacity(0)
                    
                    CardView(bikeStation: bikeStation)
                }
                .hideListSeparator
            }
        }
        .listStyle(.plain)
        .onAppear {
                viewModel.fetchBikeStations()
        }
    }
    
    
    
    //    private func calculateDistance(_ location: Location) -> String {
    //        // Calculate distance logic here
    //        return "100 meters"
    //    }
}


fileprivate extension View {
        @ViewBuilder
        var hideListSeparator: some View {
            if #available(iOS 15.0, *) {
                self
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            } else {
               self
                .listSeparatorStyle(.none)
            }
        }
    }


struct BikeStationListView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationListView()
    }
}
