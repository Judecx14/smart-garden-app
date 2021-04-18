//
//  UserForLog.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 18/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import Foundation

struct UserForLog: Codable{
    
    static var shared = UserForLog()
    
    var name:String = ""
    var lastName:String = ""
    var email:String = ""
    
}
