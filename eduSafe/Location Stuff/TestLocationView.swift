//
//  LocationContentViewTest.swift
//  eduSafe
//
//  Created by Aidan Palmer on 10/15/22.
//

import SwiftUI

struct TestLocationView: View {
    @ObservedObject var locationManager = LocationManager.shared
    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                LocationRequestView()
            } else if let location = locationManager.userLocation {
                //display actual screen
                Text("Current_Latitude: \(location.coordinate.latitude)\nCurrent_Longitude: \(location.coordinate.longitude)")
                    .padding()
            }
        }
    }
}

struct TestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        TestLocationView()
    }
}
