//
//  ViewController3.swift
//  LoginScreen2
//
//  Created by Aykut Farsak on 22/06/2017.
//  Copyright © 2017 Aykut Farsak. All rights reserved.
//

import UIKit

class Main: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func turnLoginScreen(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
}
