//
//  School.swift
//  eduSafe
//
//  Created by Addison Goolsbee on 10/15/22.
//

struct Coordinate: Codable { // user's current location
    var lat:Float
    var lon:Float
}

struct MapEdges: Codable {
    var top:Float
    var bottom:Float
    var left:Float
    var right:Float
    
}

struct imageMap: Codable {
    var imageUrl: String
    var elevation: Int
}

struct Alert: Codable {
    var location: Coordinate
    var user: String // user id
    var time: TimeInterval
    //var elevation: Int // above, below, same
    var radius: Int
}

import Foundation

class School: Codable {
    var uuid: String // admin's uid is the school's id
    var name: String
    var corners: MapEdges
    //var images: [imageMap] = []
    var alerts: [Alert] = []

    init(uuid: String, name: String, corners: mapEdges) {
        self.name = name
        self.uuid = uuid
        self.corners = corners
    }
}
