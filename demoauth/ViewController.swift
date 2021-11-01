//
//  ViewController.swift
//  demoauth
//
//  Created by 35кабинет9 on 01.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inoutLogin: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func authing(_ sender: Any) {
        
        guard !inoutLogin.text!.isEmpty else {
            return showAlertDialog(message: "Brat, you slep? Where login?")
        }
        guard !inputPassword.text!.isEmpty else {
            return showAlertDialog(message: "Brat, you stupid? Where parol to?")
        }
        
        performSegue(withIdentifier: "auth", sender: nil)
    }
    
    
    func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Errrrrorrrrr", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Nu ok(", style: .default, handler:(nil)))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}

