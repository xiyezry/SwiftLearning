//
//  UserViewController.swift
//  0501
//
//  Created by 钟仁毅 on 2020/3/21.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginPressed(_ sender: UIButton) {
        let loginVC = UserLoginViewController()
        present(loginVC,animated: true,completion: nil)
    }
    @IBAction func Login3rdPressed(_ sender: UIButton) {
        let login3rdVC = User3rdViewController()
        present(login3rdVC,animated:true,completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
