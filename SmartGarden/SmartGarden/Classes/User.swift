//
//  User.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 12/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import Foundation

struct User: Decodable{
    
    //static var userShared = User()
    
    let name: String
    let lastName:String
    let email: String
    let password: String
    
}
