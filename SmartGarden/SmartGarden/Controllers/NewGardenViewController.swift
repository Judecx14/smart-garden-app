//
//  NewGardenViewController.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 15/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import UIKit
import Alamofire

class NewGardenViewController: UIViewController {

    @IBOutlet weak var txf_name: UITextField!
    @IBOutlet weak var txf_localization: UITextField!
    
    var idd = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logedIn()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveGarden(_ sender: Any) {
        
        self.newGarden(idd: idd)
        
    }
    func newGarden(idd: Int){
        let name = txf_name.text
        let location = txf_localization.text
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/api/newGarden", method: .post, parameters: ["name":name!, "location":location!, "user_id":idd], encoding: JSONEncoding.default).responseJSON { (response) in
            if let JSON = response.result.value{
                print(JSON)
                self.performSegue(withIdentifier: "gardenAdded", sender: nil)
            }
        }
    }
    func logedIn(){
        let headers: HTTPHeaders = ["Authorization":"Bearer \(App.shared.tokensaved)", "Accept":"application/json"]
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/loggedIn", method: .get, headers: headers).responseData{(response) in
            guard let data = response.value else { return }
            print(data)
            do{
                let decoder = JSONDecoder()
                let userRecived = try decoder.decode(UserLogged.self, from: data)
                self.idd = userRecived.id
                print(userRecived)
            }catch{
                print("Error: \(error)")
            }
        }
    }
}
