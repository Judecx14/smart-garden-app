//
//  GardensViewController.swift
//  SmartGarden
//
//  Created by Eduardo Maldonado on 06/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import UIKit
import Alamofire

class GardensViewController: UIViewController {

    @IBOutlet weak var btn_new_garden: UIButton!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn_new_garden.layer.cornerRadius = 15
        btn_new_garden.layer.borderWidth = 5
        btn_new_garden.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        print(App.shared.tokensaved)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: Any){
        debugPrint("Presionado")
        /*let headers: HTTPHeaders = ["TOKEN":App.shared.tokensaved]
    Alamofire.request("https://smart-garden-api-v12.herokuapp.com/logout",headers:headers).responseJSON{(response) -> Void in
            if let JSON = response.value{
                print(JSON)
                self.performSegue(withIdentifier: "logOut", sender: nil)
            }
        }*/
        /*var urlRequest = URLRequest(url:URL(string: "https://smart-garden-api-v12.herokuapp.com/logout")!)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest = try! URLEncoding.default.encode(urlRequest, with: nil)
        urlRequest.setValue(App.shared.tokensaved, forHTTPHeaderField: "Authorization")
        Alamofire.request(urlRequest).responseJSON{response in
            print(response)
            self.performSegue(withIdentifier: "logOut", sender: nil)
        }*/
        /*Alamofire.request("https://smart-garden-api-v12.herokuapp.com/logout", method: .post, headers: ["TOKEN":App.shared.tokensaved]).responseJSON{(response) -> Void in
            print(response)
            if let JSON = response.result.value{
                print(JSON)
                self.performSegue(withIdentifier: "logOut", sender: nil)
            }
         //Funciono al igual que el HTTPHeaderField, mismo error
        }*/
        /*Alamofire.request("https://smart-garden-api-v12.herokuapp.com/logout", method: .head, parameters: ["TOKEN":App.shared.tokensaved]).responseJSON(completionHandler: {response in
            if let JSON = response.value{
                print(JSON)
                self.performSegue(withIdentifier: "logOut", sender: nil)
            }
        })*/
        /*var headersnot401: HTTPHeaders = ["Authorization":App.shared.tokensaved]
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/logout", method: .post, parameters: ["Authentication":App.shared.tokensaved],headers: headersnot401).response{(response) -> Void in
            print(response)
            if let JSON = response.request?.value{
                print(JSON)
                self.performSegue(withIdentifier: "logOut", sender: nil)
            }
        }*/
        /*let url: String = "https://smart-garden-api-v12.herokuapp.com/logout"
        var request = URLRequest(url: NSURL(string:url)! as URL)
        request.httpMethod = "POST"
        request.setValue("Bearer\(App.shared.tokensaved)", forHTTPHeaderField: "Authorization")
        request.setValue("aplication/json", forHTTPHeaderField: "Content-Type")
        Alamofire.request(request).responseJSON{(responseObject) -> Void in
            print(responseObject)
        }*/
    }
}
