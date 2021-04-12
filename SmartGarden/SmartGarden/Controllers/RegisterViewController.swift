//
//  RegisterViewController.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 05/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var txf_name: UITextField!
    @IBOutlet weak var txf_mail: UITextField!
    @IBOutlet weak var txf_passConfirm: UITextField!
    @IBOutlet weak var txf_pass: UITextField!
    @IBOutlet weak var txf_lastname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txf_name.layer.cornerRadius = 10
        txf_lastname.layer.cornerRadius = 10
        txf_mail.layer.cornerRadius = 10
        txf_pass.layer.cornerRadius = 10
        txf_passConfirm.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    @IBAction func regist(_ sender: Any) {
        self.registerUser()
    }
    func registerUser(){
        let nick = txf_name.text
        let mail = txf_mail.text
        let pass = txf_pass.text
        Alamofire.request("http://127.0.0.1:3333/register",method: .post, parameters: ["username":nick!,"email":mail!,"password":pass!], encoding: JSONEncoding.default).responseJSON{(response) -> Void in
            if let JSON = response.result.value{
                print(JSON)
            }
        }
    }
}
