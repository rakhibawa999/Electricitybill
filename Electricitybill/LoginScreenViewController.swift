//
//  LoginScreenViewController.swift
//  Electricitybill
//
//  Created by rakhi on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController
{
    
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var password: UITextField!
    var userDefault: UserDefaults?
    
    @IBOutlet weak var Swtchremember: UISwitch!
    @IBAction func btnlogin(_ sender: Any) {
        if txtusername.text == "admin" && password.text == "password"
        {
            userDefault?.setValue(txtusername.text, forKey: "email")
            userDefault?.setValue(password.text, forKey: "password")
            performSegue(withIdentifier: "ElectricityBillViewController", sender: self)

        } else {
            print("error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefault = UserDefaults.standard
        if let userEmail = userDefault?.value(forKey: "email")
        {
            //if let userPassword
            txtusername.text = userEmail as! String
        }
        // Do any additional setup after loading the view.
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
