//
//  Auth.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 13/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import Foundation

class Auth: Decodable{
    let token: String
    let refreshToken: String?
    let type: String
    init (_ token: String, _ refreshToken: String, type: String){
        self.token = token
        self.refreshToken = refreshToken
        self.type = type
    }
    func getToken() -> (String){
        return self.token
    }
    func store(){
            //let encoder = JSONEncoder()
            //let data = try encoder.encode(App.shared.tokensaved)
        App.shared.defaults.setValue(App.shared.tokensaved, forKey: "Token")
    }
}
