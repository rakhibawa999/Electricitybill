//
//  ViewController.swift
//  Electricitybill
//
//  Created by rakhi on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        perform(#selector(self.shownavcontroller), with: nil, afterDelay: 3)
//       perform(Selector(("shownavcontroller")), with: nil, afterDelay: 3)
    }

    @objc func shownavcontroller()
    {
        performSegue(withIdentifier: "showloginscreen", sender: self)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

