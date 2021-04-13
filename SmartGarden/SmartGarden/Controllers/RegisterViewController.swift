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
        self.verify()
    }
    func verify(){
        debugPrint("Presionado")
        let txfName = txf_name.text!
        //let txfLastName = txf_lastname.text!
        let txfMail = txf_mail.text!
        let txfPass = txf_pass.text!
        let txfPassConfirm = txf_passConfirm.text!
        
        if txfName.isEmpty || txfMail.isEmpty || txfPass.isEmpty{
            let alertEmptyString = UIAlertController(title: "Faltan Datos", message: "Alguno de los campos estan vacios", preferredStyle: .alert)
            alertEmptyString.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alertAction) in alertEmptyString.dismiss(animated: true, completion: nil)}))
            self.present(alertEmptyString, animated: true, completion: nil)
            txf_name.shake()
            txf_lastname.shake()
            txf_mail.shake()
            txf_pass.shake()
            txf_passConfirm.shake()
            debugPrint("Llegue hasta donde fallo porque no hay datos")
        }
        else if txfPass == txfPassConfirm{
            self.registerUser()
            self.performSegue(withIdentifier: "xCosa2", sender: nil)
            debugPrint("Llegue hasta que todo funciono")
        }
        else if txfPass != txfPassConfirm{
            let alertDifferentePassword = UIAlertController(title: "Las contraseñas no coinciden", message: "Las contraseñas ingresadas no coinciden, no son iguales", preferredStyle: .alert)
            alertDifferentePassword.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alertAction) in alertDifferentePassword.dismiss(animated: true, completion: nil)}))
            self.present(alertDifferentePassword, animated: true, completion: nil)
            txf_pass.shake()
            txf_passConfirm.shake()
            debugPrint("Llegue hasta donde las contraseñas fallaron")
        }
        
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
