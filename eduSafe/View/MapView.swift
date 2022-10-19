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
    @State var clicked: Bool = false
    
    
    var body: some View {
        // every 25 ms, call a func displayAlerts
        // printalerttomap, put dot on map with percentage
    
        VStack {
            ZStack {
                Image("layout").resizable().scaledToFit()
                GeometryReader { geometry in
                    let width1 = geometry.size.width*0.3
                    let height1 = geometry.size.height*0.4
                    let width2 = geometry.size.width*0.7
                    let height2 = geometry.size.height*0.15
                    
                    PinComponent(color: .blue).offset(x: width1,y:height1)
                    PinComponent(color: .red).offset(x: width2,y:height2)
                    PinComponent(color: .red).offset(x: width2*0.84,y:height2*1.23)
                    PinComponent(color: .red).offset(x: width2*0.75,y:height2*0.8)
                    PinComponent(color: .red).offset(x: width2*1,y:height2*1.9)
                    
                    if (!clicked) {
                        PinComponent(color: .red).offset(x: width2*0.8,y:height2*0.8).hidden()
                    } else {
                        PinComponent(color: .red).offset(x: width1,y:height1)

                    }
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
                clicked = true
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
