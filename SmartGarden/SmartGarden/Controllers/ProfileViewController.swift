//
//  ProfileViewController.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 07/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {

    @IBOutlet weak var txf_name: UITextField!
    @IBOutlet weak var btn_acerca: UIButton!
    @IBOutlet weak var txf_email: UITextField!
    @IBOutlet weak var txf_lastName: UITextField!
    
    let headers: HTTPHeaders = ["Authorization":"Bearer \(App.shared.tokensaved)", "Accept":"application/json"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func deleteProfile(_ sender: Any) {
        self.loggedIn()
    }
    
    @IBAction func updateProfile(_ sender: Any) {
        let nombre = txf_name.text!
        let apellido = txf_lastName.text!
        let email = txf_email.text!
        
        if nombre.isEmpty || apellido.isEmpty || email.isEmpty{
            let alertEmptyData = UIAlertController(title: "Campos vacios", message: "Porfavor rellena los campos", preferredStyle: .alert)
            alertEmptyData.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alertAction) in
                alertEmptyData.dismiss(animated: true, completion: nil)
            }))
            self.present(alertEmptyData, animated: true, completion: nil)
            
        }else{
            Alamofire.request("https://smart-garden-api-v12.herokuapp.com/loggedIn", method: .get, headers: headers).responseData{(response) in
                guard let data = response.value else { return }
                do{
                    let decoder = JSONDecoder()
                    let userLog = try decoder.decode(UserLogged.self, from: data)
                    self.getUserID(id: userLog.id)
                    //self.updateUser(id: userLog.id)
                }catch{
                    print("Error: \(error)")
                }
            }
        }
    }
    
    func updateUser(id: Int,nameS:String,lastNameS:String,emailS:String){
        
        let nombreUP = txf_name.text
        let apellidoUP = txf_lastName.text
        let emailUP = txf_email.text
        
        print("Tengo el ID: \(id)")
        print(nameS,lastNameS,emailS)
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/update", method: .put, parameters: ["id":id,"name":nombreUP ?? nameS,"lastName":apellidoUP ?? lastNameS,"email":emailUP ?? emailS], encoding: JSONEncoding.default, headers: headers).responseJSON{(response) in
            if let JSON = response.result.value{
                print(JSON)
            }else{
                print("Error: No se armo ")
            }
        }
    }
    
    func getUserID(id: Int){
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/getUser/\(id)", method: .get, headers: headers).responseData { (response) in
            guard let data = response.value else { return }
            do{
                let decoder = try JSONDecoder().decode(UserForLog.self, from: data)
                self.updateUser(id: id, nameS: decoder.name, lastNameS: decoder.lastName, emailS: decoder.email)
            }catch{
                print("Error: \(error)")
            }
        }
    }
    func loggedIn(){
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/loggedIn", method: .get, headers: headers).responseData{(response) in
            guard let data = response.value else { return }
            do{
                let decoder = JSONDecoder()
                let userLog = try decoder.decode(UserLogged.self, from: data)
                self.deleteProfileID(idD: userLog.id)
            }catch{
                print("Error: \(error)")
            }
        }
    }
    func deleteProfileID(idD:Int){
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/delete", method: .delete, parameters: ["id":idD], encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if let JSON = response.result.value{
                print(JSON)
                self.performSegue(withIdentifier: "profileDeleted", sender: nil)
            }else{
                print("Nada")
            }
        }
    }
}

