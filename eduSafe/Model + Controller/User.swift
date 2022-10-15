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
    
    init(uuid: String, name: String) {
        self.name = name
        self.uuid = uuid
    }
}
