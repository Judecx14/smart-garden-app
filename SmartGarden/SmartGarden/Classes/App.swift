//
//  App.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 13/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import Foundation

class App: NSObject{
    static var shared = App()
    let defaults = UserDefaults.standard
    var tokensaved:String = ""
}
