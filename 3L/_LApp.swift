//
//  _LApp.swift
//  3L
//
//  Created by ksd on 08/03/2023.
//

import SwiftUI

@main
struct _LApp: App {
    
    @StateObject var locationController = LocationController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(locationController)
        }
    }
}
