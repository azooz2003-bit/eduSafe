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
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        // every 25 ms, call a func displayAlerts
        // printalerttomap, put dot on map with percentage
    
        VStack {
            ZStack {
                Image("layout").resizable().scaledToFit()
                GeometryReader { geometry in
                    let width = geometry.size.width*0.3
                    let height = geometry.size.height*0.4
                    
                    PinComponent().offset(x: width,y:height)
                    
                    // use a forEach loop to add all the alerts in an array as blue pins
                    // Foreach(alerts)
                }
                        
            }.border(.black, width: 3).frame(minWidth: 300, maxWidth: 500,minHeight: 100, maxHeight: 300, alignment: .center).padding(.leading).padding(.trailing).onReceive(timer, perform: { _ in
                        print("updating") // change loc
                        
                        //displayAlert: displays all alerts from firebase
                        //updateLoc: update user loc on map relative to corners
                        //
                    })
            Button(action: {
                //addAlert(): adds alert to the userVM and firebase
            }) {
                Text("Alert!").padding()
            }
        }
        
        
        
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

// left 42.381032433383986, -71.12549713996725
// bottom 42.38058862416593, -71.12512162919748
// right 42.38077486551393, -71.12473270978384
// top 42.3812127321162, -71.12511090110623

// dummy value: 42.383, -71.125
