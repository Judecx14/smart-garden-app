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
        self.request5()
    }
    func request(){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/1", method: .get).responseJSON{(response) -> Void in
            if let JSON = response.result.value{
            print(JSON)
            }
        }
    }
    func request2(){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/", method: .get, parameters: ["id":90], encoding: URLEncoding.default).responseJSON(){response in debugPrint(response)
        }
    }
    func request3(){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/1", method: .get).responseJSON(){response in debugPrint(response)
        }
    }
    func request4(){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/1",method: .get).response(){response in debugPrint(response)}
    }
    func request5(){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/",method: .get, parameters: ["id":3], encoding: URLEncoding.httpBody).responseJSON{(response) -> Void in
            if let JSON = response.result.value{
                print(JSON)
            }
        }
    }
}
