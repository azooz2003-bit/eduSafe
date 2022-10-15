//
//  SchoolViewModel.swift
//  eduSafe
//
//  Created by Addison Goolsbee on 10/15/22.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseStorage



class SchoolViewModel: ObservableObject {
//    @Published var user: User?
//
//    private let auth = Auth.auth()
//    private let db = Firestore.firestore()
    
}




//func getImage() {
//    let storage = Storage.storage()
//    let gsReference = storage.reference(forURL: "gs://edusafe-ffcb0.appspot.com/YaleProfile.jpeg")
//    //
//    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
//      if let error = error {
//          print(error)
//      } else {
//        return UIImage(data: data!)
//      }
//    }
//}


//
//islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
//  if let error = error {
//    // Uh-oh, an error occurred!
//  } else {
//    // Data for "images/island.jpg" is returned
//    let image = UIImage(data: data!)
//  }
//}

// needed functions
// locationToMap: takes in coordinate (and elevation) and places it on the map image
// displayAlerts: iterates through list of school's alerts and places them on map image
//      printAlert: makes a visual alert thing and puts it on the screen (over the map)


// locationToMap (c:coordinate, map:mapEdges)
// returns a coordinate: resLat, resLon
// if lat < map.left, resLat = map.left. if lat > map.right, resLat = map.right. Else resLat = (map.right-lat) * MAP_SCALE
// repeat for lon and map.top/bottom

// displayAlerts()
// get schoolID from user:
// let uid = auth.currentUser?.uid      (throw error if no user)
// school = db.collection("users").document(uid).school
// get alerts array in school:
// alerts[] = db.collections("schools").document(school).alerts
// for each alert in alerts:
//      if alert.time < 2 hours
//          printAlert(alert, school)

// printAlert()
// make a red circle, along with a larger semi-transparent circle around it (length = radius)
// transparencyMultiplier = (2hours - (0.75 * time))
// visualAlert.opacity *= transparencyMultiplier
// put the dot on the map at the location: locationToMap(alert.location, school.mapEdges)
