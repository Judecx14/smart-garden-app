//
//  ViewController.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 04/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  
    @IBOutlet weak var btn_login_sg: UIButton!
    @IBOutlet weak var txf_pass_sg: UITextField!
    @IBOutlet weak var bkg_round: UIView!
    @IBOutlet weak var txf_mail_sg: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.request()
    }
    func request(){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/1", method: .get).responseJSON{(response) -> Void in
            if let JSON = response.result.value{
                print(JSON)
            }
        }
    }


}

