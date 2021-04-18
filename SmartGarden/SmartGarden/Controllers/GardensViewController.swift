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

    @IBOutlet weak var viewBK: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var lb_Nombre: UILabel!
    @IBOutlet weak var lb_Location: UILabel!
    @IBOutlet weak var btn_new_garden: UIButton!
    @IBOutlet weak var IV_image: UIImageView!
    @IBOutlet weak var lb_created_at: UILabel!
    
    @IBOutlet weak var stackView2: UIStackView!
    
    @IBAction func new(_ sender: Any) {
        self.performSegue(withIdentifier: "addNewGarden", sender: nil)
    }
    
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBK.layer.cornerRadius = 10
        btn_new_garden.layer.cornerRadius = 15
        btn_new_garden.layer.borderWidth = 5
        btn_new_garden.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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
            //print(data)
            do{
                let decoder = JSONDecoder()
                let userRecived = try decoder.decode(UserLogged.self, from: data)
                //self.getGardens(idd: self.idd)
                //print("tengo este id: ",self.idd)
                let height = 100
                let spacing = 10
                var positionY = 0
                self.getStoredGardens(idde: userRecived.id) { (gardens) in
                    /*for jardines in gardens{
                        
                        let gardenStack = UIGardenStack(frame: CGRect(x: 0, y: positionY, width: Int(self.stackView.frame.width), height: height))
                        self.lb_Nombre.text = jardines.name
                        self.lb_Location.text = jardines.location
                        self.lb_created_at.text = jardines.created_at
                        self.IV_image.image = UIImage(named: "plantas 2.ong")
                        self.viewBK.backgroundColor = .brown
                        self.stackView.addSubview(gardenStack)
                        
                    }*/
                    gardens.forEach{ jardines in
                        let gardenStack = UIGardenStack(frame: CGRect(x: 0, y: positionY, width: Int(self.stackView2.frame.width), height: height))
                        /*
                        print(jardines)
                        self.lb_Nombre.text = jardines.name
                        self.lb_Location.text = jardines.location
                        self.lb_created_at.text = jardines.created_at
                        self.IV_image.image = UIImage(named: "plantas 2.png")
                        self.viewBK.backgroundColor = .brown
                        self.stackView2.addSubview(gardenStack)
                         */
                        self.IV_image.image = UIImage(named: "plantas 2.png")
                        self.viewBK.backgroundColor = .brown
                        gardenStack.buildGarden(jardines)
                        self.stackView2.addSubview(gardenStack)
                        positionY += height + spacing
                        
                    }
                    self.scrollView.contentSize.height = CGFloat(5 * (height + spacing))
                }
            }
            catch
            {
                print("Error: \(error)")
            }
        }
    }
    func getStoredGardens(idde:Int, completionHandler: @escaping([GardensSaved])->Void){
        Alamofire.request("https://smart-garden-api-v12.herokuapp.com/api/Garden/showByUser?id=\(idde)", method: .get).responseData(completionHandler: {(response) in
            guard let data = response.value else { return }
            do{
                let decoder = try  JSONDecoder().decode([GardensSaved].self , from: data)
                completionHandler(decoder)
            }catch{
                print("Error \(error)")
            }
        })
    }
}
