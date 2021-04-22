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

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func new(_ sender: Any) {
        self.performSegue(withIdentifier: "addNewGarden", sender: nil)
    }
    
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        logedIn()

        // Do any additional setup after loading the view.
    }
    @IBAction func logOut(_ sender: Any){
        debugPrint("Presionado")
        let headersnot401: HTTPHeaders = ["Authorization":"Bearer \(App.shared.tokensaved)", "Accept":"aplication/json"]
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/logout", method: .post, parameters: ["Authentication":App.shared.tokensaved],headers: headersnot401).responseJSON{(response) -> Void in
            print(response)
            if let JSON = response.request?.value{
                self.performSegue(withIdentifier: "logOut", sender: nil)
            }else{
                let alertwronglogout = UIAlertController(title: "Fallo el Logout", message: "Token Incorrecto", preferredStyle: .alert)
                alertwronglogout.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alertAction) in
                    alertwronglogout.dismiss(animated: true, completion: nil)
                }))
                self.present(alertwronglogout, animated: true, completion: nil)
            }
        }
    }
    func logedIn(){
        let headers: HTTPHeaders = ["Authorization":"Bearer \(App.shared.tokensaved)", "Accept":"application/json"]
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/loggedIn", method: .get, headers: headers).responseData{(response) in
            guard let data = response.value else { return }
            do{
                let decoder = JSONDecoder()
                let userLog = try decoder.decode(UserLogged.self, from: data)
                
                let height = 100
                let spacing = 10
                var positionY = 0
                
                self.getStoredGardens(idde: userLog.id, completionHandler: { (gardens) in
                    let testButton = TestButton(frame: CGRect(x: 20, y: 20, width: 185, height: 200))
                    let testButtonn = TestButton(frame: CGRect(x: 220, y: 20, width: 185, height: 200))
                    let testButtonnn = TestButton(frame: CGRect(x: 20, y: 235, width: 185, height: 200))
                    gardens.forEach({ (jardines) in
                        
                        
                   

                        
                        //print(jardines.name)
                        /*let gardenStack = UIGardenStack(frame: CGRect(x: 0, y: positionY, width: Int(self.stackView.frame.width), height: height))
                        gardenStack.buildGarden(jardines)
                        self.scrollView.addSubview(gardenStack)
                        positionY += height + spacing*/
                    })
                    self.scrollView.addSubview(testButton)
                    self.scrollView.addSubview(testButtonn)
                    self.scrollView.addSubview(testButtonnn)
                    //self.scrollView.contentSize.height = CGFloat(5 * (height + spacing))
                })
            }catch{
                print("Error \(error)")
            }
        }
    }
            
            
    func getStoredGardens(idde:Int, completionHandler: @escaping([GardensSaved])->Void){
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/api/Garden/showByUser?id=\(idde)", method: .get).responseData(completionHandler: {(response) in
            guard let data = response.value else { return }
            do{
                //print("xcosa", idde)
                let decoder = try  JSONDecoder().decode([GardensSaved].self , from: data)
                completionHandler(decoder)
                print(decoder)
            }catch{
                print("Error \(error)")
            }
        })
    }
}
