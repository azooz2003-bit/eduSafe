//
//  User.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/14/22.
//

import Foundation

class User: Codable {
    var uuid: String
    var name: String
    var hasPassword: Bool
    var schoolid: String
    
    init(uuid: String, name: String, hasPassword: Bool, schoolid: String) {
        self.name = name
        self.uuid = uuid
        self.hasPassword = hasPassword
        self.schoolid = schoolid
    }
}
