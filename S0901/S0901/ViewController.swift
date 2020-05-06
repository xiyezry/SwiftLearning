//
//  ViewController.swift
//  S0901
//
//  Created by 钟仁毅 on 2020/4/15.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return }
        let queryResult = sqlite.execQuerySQL(sql: "SELECT * FROM student WHERE id = '1';")
        for row in queryResult!{
            idTextField.text = "\(row["id"]!)"
            nameTextField.text=((row["name"]! as! String))
            emailTextField.text=((row["phone"]! as! String))
        }
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func testButton(_ sender: Any) {
        Test.initDB()
        Test.GetStudent()
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return}
        let ss = "UPDATE student SET name = '\( nameTextField.text!))', phone = '\(emailTextField.text!)' WHERE id = '1'"
        if !sqlite.execNoneQuerySQL(sql: ss){sqlite.closeDB();return}
        sqlite.closeDB()
    }
}

