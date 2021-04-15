//
//  UserLogged.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 15/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import Foundation

struct UserLogged: Decodable{
    let id: Int
    let username: String
    let state:Bool
}
