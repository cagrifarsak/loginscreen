//
//  ViewController.swift
//  LoginScreen2
//
//  Created by Aykut Farsak on 21/06/2017.
//  Copyright © 2017 Aykut Farsak. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Login: UIViewController {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var emailBox: UITextField!
    @IBOutlet weak var passwordBox: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.label.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.title = "Welcome"

    }

    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""
    }

    @IBAction func doLogin(_ sender: Any) {
        // hide error message
        self.label.isHidden = true

        let parameters: Parameters = [
            "email": emailBox.text ?? "",
            "password": passwordBox.text ?? ""
        ]
        

        Alamofire.request("http://ortakoltuk.com:8080/login", method: .post, parameters: parameters).responseJSON { response in

            if let json = response.data {

                let data = JSON(data: json)

                if data["success"].bool! {

                    print("başarılı")
                    self.label.isHidden = true

                    DispatchQueue.main.async() {
                        self.performSegue(withIdentifier: "segue1", sender: self)
                    }

                } else {
                    print("başarısız")
                    self.label.isHidden = false
                }

            }
        }
    }
    
    @IBAction func goToRegister(_ sender: UIButton) {
        
        DispatchQueue.main.async() {
            self.performSegue(withIdentifier: "segue2", sender: self)
        }
    }
    
}

