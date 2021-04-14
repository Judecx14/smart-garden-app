//
//  User.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 12/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import Foundation

struct User: Decodable{
    let name: String
    let lastname:String
    let email: String
    let password: String
    
    init(_ name:String, _ lastname:String, _ email:String, _ password:String) {
        self.name=name
        self.lastname=lastname
        self.email=email
        self.password=password
    }
}
