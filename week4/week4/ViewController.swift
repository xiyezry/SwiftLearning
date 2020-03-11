//
//  ViewController.swift
//  week4
//
//  Created by 钟仁毅 on 2020/3/11.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var pwdLbl: UITextField!
    @IBOutlet weak var isCPMSwitch: UISwitch!
    @IBOutlet weak var educationSeg: UISegmentedControl!
    @IBOutlet weak var sliderLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func doneEdit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func tapd(_ sender: UITapGestureRecognizer) {
        nameLbl.resignFirstResponder()
        pwdLbl.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        sliderLbl.text = "\(lroundf(sender.value))"
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        let u = UserInfo()
        u.name = nameLbl.text!
        u.pwd = pwdLbl.text!
        u.isCPM = isCPMSwitch.isOn
        u.setEduByIndex(index: educationSeg.selectedSegmentIndex)
        u.IQ = Int(sliderLbl.text!)!
        
        print(u)
    }
        
}

