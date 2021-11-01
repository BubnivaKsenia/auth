//
//  ViewController.swift
//  demoauth
//
//  Created by 35кабинет9 on 01.11.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var inputLogin: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    let userDef = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("You token is:\(userDef.value(forKey: "token"))")
    }

    @IBAction func authing(_ sender: Any) {
        
        guard !inputLogin.text!.isEmpty else {
            return showAlertDialog(message: "Brat, you slep? Where login?")
        }
        guard !inputPassword.text!.isEmpty else {
            return showAlertDialog(message: "Brat, you stupid? Where parol to?")
        }
        let url = "https://recipe.mdwar.ru/signin?Login=\(inputLogin.text!)&pass=text\(inputPassword.text!)"
            AF.request(url, method: .post).validate().responseJSON{(response) in
                switch response.result{
                case.success(let value):
                    let json = JSON(value)
                    let jsonToken = json["notice"]["token"].stringValue
                    self.userDef.setValue(jsonToken, forKey: "token")
                case.failure(let error):
                    self.showAlertDialog(message: error.localizedDescription)
                }
            }
        
        performSegue(withIdentifier: "auth", sender: nil)
    }
    
    
    func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Errrrrorrrrr", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Nu ok(", style: .default, handler:(nil)))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}

