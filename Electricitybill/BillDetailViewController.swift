//
//  BillDetailViewController.swift
//  Electricitybill
//
//  Created by rakhi on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit
protocol PassDataProtocol {
    func setTotal(totalBill: Double)
}

class BillDetailViewController: UIViewController {
    @IBOutlet weak var txtcustomername: UILabel!
    @IBOutlet weak var txttotalbill: UILabel!
    @IBOutlet weak var txtgender: UILabel!
    var electricitybill : ElectricityBill!
    var delegate: PassDataProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let bill = electricitybill
        {
            print(bill.customername!)
            calculateTotalBillAmount()
            
            //Set Values
            self.txtcustomername.text = electricitybill.customername
            self.txtgender.text = electricitybill.gender?.rawValue
            self.txttotalbill.text = String(format: "Total: %.2f",  electricitybill.totalbillamount!)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func calculateTotalBillAmount()
    {
        
        var totalBill = 0.0
        if(electricitybill?.unitconsumed)! <= 100
        {
            totalBill = Double((electricitybill?.unitconsumed)!) * 0.75
        }else if (electricitybill?.unitconsumed)! <= 250
        {
            totalBill = 75 + (Double((electricitybill?.unitconsumed)!) - 100) * 1.25
        }else if (electricitybill?.unitconsumed)! <= 450
        {
            totalBill = 262.2 + (Double((electricitybill?.unitconsumed)!) - 250) * 1.75
        }else
        {
            totalBill = 612.5 + (Double((electricitybill?.unitconsumed)!) - 450) * 2.25
        }
        electricitybill.totalbillamount = totalBill
        delegate?.setTotal(totalBill: totalBill)
        print(totalBill)
    }
}
