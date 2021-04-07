//
//  RegisterViewController.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 05/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import UIKit

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
