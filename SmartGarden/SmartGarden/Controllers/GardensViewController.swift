//
//  GardensViewController.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 06/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import UIKit

class GardensViewController: UIViewController {

    @IBOutlet weak var btn_new_garden: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn_new_garden.layer.cornerRadius = 15
        btn_new_garden.layer.borderWidth = 5
        btn_new_garden.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
