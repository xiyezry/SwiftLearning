//
//  ViewController.swift
//  S0801
//
//  Created by 钟仁毅 on 2020/4/15.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var student:Student?
    var isAdd:Bool = true
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var scoreTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let stu = self.student{
            nameTextField.text = stu.name
            birthdayTextField.text = stu.birthday
            scoreTextField.text = stu.score
            addressTextField.text = stu.address
        }
    }

    
    @IBAction func saveButonTapped(_ sender: Any) {
        if let stu = self.student{
            stu.name = nameTextField.text!
            stu.birthday = birthdayTextField.text!
            stu.score = scoreTextField.text!
            stu.address = addressTextField.text!
        }
        
        performSegue(withIdentifier: "UnWin", sender: self)
    }
}

