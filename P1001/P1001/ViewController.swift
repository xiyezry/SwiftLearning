//
//  ViewController.swift
//  P1001
//
//  Created by 钟仁毅 on 2020/4/29.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    let uuidKey = "UUID"
    let nameKey = "NAME"
    let hobbyKey = "Hobby"
    @IBOutlet weak var uuid_preference: UITextField!
    
    @IBOutlet weak var name_preference: UITextField!
    @IBOutlet weak var hobbyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func readButtonPressed(_ sender: Any) {
        uuid_preference.text = defaults.string(forKey: uuidKey)
        name_preference.text = defaults.string(forKey: nameKey)
        hobbyLabel.text = defaults.string(forKey: hobbyKey)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let uuid = uuid_preference.text!
        let name = name_preference.text!
        defaults.set(uuid, forKey: uuidKey)
        defaults.set(name, forKey: nameKey)
    }
}

