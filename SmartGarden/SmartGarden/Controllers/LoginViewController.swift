//
//  LoginViewController.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 05/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var txf_mail: UITextField!
    @IBOutlet weak var txf_pass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        txf_mail.layer.cornerRadius = 10
        txf_pass.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    @IBAction func Login(_ sender: Any) {
        self.verify()
    }
    @IBAction func pushRegister(_ sender: Any) {
        self.performSegue(withIdentifier: "GoToRegister", sender: nil)
    }
    func verify(){
        let txfmail = txf_mail.text!
        let txfpass = txf_pass.text!
//Verificar que los campos no esten vacios
        if txfmail.isEmpty || txfpass.isEmpty{
            let alertEmptyString = UIAlertController(title: "Faltan Datos", message: "Alguno de los campos estan vacios", preferredStyle: .alert)
            alertEmptyString.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alertAction) in alertEmptyString.dismiss(animated: true, completion: nil)}))
            self.present(alertEmptyString, animated: true, completion: nil)
            debugPrint("No funciono login")
            return
        }
//Datos de login correctos
        else{
            Alamofire.request("https://smart-garden-api-v12.herokuapp.com/login", method: .post, parameters: ["email":txfmail,"password":txfpass], encoding: JSONEncoding.default).responseJSON{(array_respuesta) in
                if let JSON = array_respuesta.result.value{
                    print(JSON)
                }
            }
            self.performSegue(withIdentifier: "LoginSuccessfull", sender: nil)
        }
    }
}
