//
//  School.swift
//  eduSafe
//
//  Created by Addison Goolsbee on 10/15/22.
//

struct Coordinate: Codable {
    var lat:Float
    var lon:Float
}

struct Corners: Codable {
    var topLeft:Coordinate
    var topRight:Coordinate
    var BottomLeft:Coordinate
    var BottomRight:Coordinate
}

struct imageMap: Codable {
    var imageUrl: String
    var elevation: Int
}

struct Alert: Codable {
    var location: Coordinate
    var user: String // user id
    var time: TimeInterval
    var elevation: Int
    var radius: Int
}

import Foundation

class School: Codable {
    var uuid: String // admin's uid is the school's id
    var name: String
    var corners: Corners
    var images: [imageMap] = []
    var alerts: [Alert] = []

    init(uuid: String, name: String, corners: Corners) {
        self.name = name
        self.uuid = uuid
        self.corners = corners
    }
}
