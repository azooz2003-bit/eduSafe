//
//  User.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/14/22.
//

import Foundation

class User: Codable {
    var email: String
    var uuid: String
    var name: String
    var hasPassword: Bool = false
    var schoolid: String
    
    init(email: String, uuid: String, name: String, hasPassword: Bool = false, schoolid: String) {
        self.email = email
        self.hasPassword = hasPassword
        self.name = name
        self.uuid = uuid
        self.schoolid = schoolid
    }
}
