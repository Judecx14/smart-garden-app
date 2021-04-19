//
//  UIGardenStack.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 17/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import UIKit

class UIGardenStack: UIView {
    
    public private(set) var gardenName:UILabel?
    public private(set) var gardenLocation:UILabel?
    public private(set) var gardenCreatedAt:UILabel?
    public private(set) var imageGarden:UIImage?
    
    
    func buildGarden(_ garden:GardensSaved){
        
        self.gardenName? = UILabel(frame: CGRect(x: 15, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        self.gardenName?.text = garden.name
        self.gardenName?.font = UIFont(name: "Verdana", size: 10)
        self.gardenName?.textColor = UIColor.darkGray
        self.gardenLocation = UILabel(frame: CGRect(x: 15, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        self.gardenLocation?.text = garden.location
        self.gardenLocation?.font = UIFont(name: "Verdana", size: 10)
        self.gardenLocation?.textColor = UIColor.darkGray
        self.gardenCreatedAt = UILabel(frame: CGRect(x: 15, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        self.gardenCreatedAt?.text = garden.created_at
        self.gardenCreatedAt?.font = UIFont(name: "Verdana", size: 10)
        self.gardenCreatedAt?.textColor = UIColor.darkGray
        //self.imageGarden = UIImage.s
        //self.imageGarden?.images = UIImage(named: "plantas 2.png")
    }

}
