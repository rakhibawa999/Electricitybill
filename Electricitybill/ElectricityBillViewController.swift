//
//  ElectricityBillViewController.swift
//  Electricitybill
//
//  Created by rakhi on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class ElectricityBillViewController: UIViewController,PassDataProtocol{
    
    @IBOutlet weak var txtcustomerid: UITextField!
    @IBOutlet weak var txtcustomername: UITextField!
    @IBOutlet weak var opgender: UISegmentedControl!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var txtunit: UITextField!
    
    @IBOutlet weak var lblTotalBill: UILabel!
    var electricitybill : ElectricityBill!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //lblTotalBill.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCalculateBill(_ sender: Any) {
        electricitybill = ElectricityBill(customerID: Int(txtcustomerid.text!), customername: txtcustomername.text!, gender: Gender.MALE, billdate: Date(), unitconsumed: Int(txtunit.text!), totalbillamount: 0)
        performSegue(withIdentifier: "nv", sender: self)
    }

    func setTotal(totalBill: Double) {
        print("A = \(totalBill)")
     //   lblTotalBill.isHidden = false
        lblTotalBill.text = "Total Bill: $\(totalBill)"
    }
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? BillDetailViewController {
            print("#####  \(electricitybill)")
            destVC.electricitybill = electricitybill
             destVC.delegate = self
           
        }
        
    
    }
}
