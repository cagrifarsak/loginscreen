//
//  Register.swift
//  LoginScreen2
//
//  Created by Aykut Farsak on 29/06/2017.
//  Copyright © 2017 Aykut Farsak. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Register: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var registerEmail: UITextField!
    
    @IBOutlet weak var registerName: UITextField!
    
    @IBOutlet weak var registerPassword: UITextField!

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.label.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func registerToLogin(_ sender: Any) {
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        let parametersRegister: Parameters = [
            "email": registerEmail.text ?? "",
            "name": registerName.text ?? "",
            "password": registerPassword.text ?? ""
        ]
        
        Alamofire.request("http://ortakoltuk.com:8080/register", method: .post, parameters: parametersRegister).responseJSON { response in
            
            
            if let json = response.data {
                
                let data = JSON(data: json)
                
                if data["success"].bool! {
                    
                    print("başarılı")
                    
                    DispatchQueue.main.async() {
                        self.performSegue(withIdentifier: "segue2", sender: self)
                        
                    }
                    self.label.isHidden = true
                    self.activityIndicator.stopAnimating()
                    
                    
                } else {
                    
                    //textlerin içini boşalt.
                    
                    print("başarısız")
                    self.label.isHidden = false
                    self.activityIndicator.stopAnimating()
                }
                
            }
        }
    }
}
