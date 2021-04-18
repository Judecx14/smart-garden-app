//
//  Gardens.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 15/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import Foundation

struct GardensSaved: Codable {
    var id:Int
    var user_id:Int
    var name: String
    var location: String
    var created_at: String
}
