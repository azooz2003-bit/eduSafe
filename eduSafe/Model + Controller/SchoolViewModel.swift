//
//  SchoolViewModel.swift
//  eduSafe
//
//  Created by Addison Goolsbee on 10/15/22.
//

import Foundation
import SwiftUI


//private let auth = Auth.auth()
//private let db = Firestore.firestore()

//
//let store = Storage.storage()
//
//let gsReference = storage.reference(forURL: "gs://edusafe-ffcb0.appspot.com/YaleProfile.jpeg")
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

// displayAlerts
// make sure the user is logged in and verified
// get schoolID from user
// get alerts array in school
// for each alert in alerts:
// printAlert:
// put dot on map at locationToMap(alert.location, school.mapEdges), adjusted to the frontend zoom/placement
//  - more transparent the longer it's been since the alert, until it's been 2 hours where it disappears
//  - radius is already partially transparent, and alert.radius changes circle radius





// later functions
// ?go to next floor: switches the current map view
// ?zoom/swipe functions

