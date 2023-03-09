//
//  ContentView.swift
//  3L
//
//  Created by ksd on 08/03/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @EnvironmentObject var locationController: LocationController
    
    @State private var coordinateRegion = MKCoordinateRegion()
    
    var body: some View {
        
        Map(coordinateRegion: $coordinateRegion, showsUserLocation: true)
            .onReceive(locationController.$coordinateRegion) { coordinateRegion  in
                print("onRecieve: \(coordinateRegion.center)")
                self.coordinateRegion = coordinateRegion
            }
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LocationController())
    }
}
