//
//  Sensor.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 18/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import Foundation

struct Sensor: Decodable{
    
    let id:Int
    let name: String
    let pins:[Int]
    let type:String
}
