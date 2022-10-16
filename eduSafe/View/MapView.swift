//
//  MapView.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/15/22.
//

import SwiftUI
import FirebaseStorage


struct MapView: View {
    @StateObject var locationManager = LocationManager.shared
    @State var currentLong: Float
    @State var currentLat: Float
    @State var corners: Corners = Corners(left: <#T##Float#>, right: <#T##Float#>, top: <#T##Float#>, bottom: <#T##Float#>)
    
    
    var body: some View {
        ZStack {
            GeometryReader { size in
                
            }
            Image("layout").resizable().scaledToFit()
            PinComponent() // location on blueprint:
        }.border(.black, width: 3).padding(.leading).padding(.trailing)
        locationManager.userLocation?.coordinate
    }
}

//func bringImage() {
//    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
//        return UIImage(data: data!)
//    
//    }
//}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}



