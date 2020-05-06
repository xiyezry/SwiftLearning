//
//  User3rdViewController.swift
//  0501
//
//  Created by 钟仁毅 on 2020/3/21.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class User3rdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func login3rd(_ sender: UIButton) {
        let p = UIAlertController(title: "第三方登录", message: nil, preferredStyle: .actionSheet)
        p.addAction(UIAlertAction(title: "QQ", style: .default, handler: nil))
        p.addAction(UIAlertAction(title: "信息门户", style: .destructive, handler: nil))
        p.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        present(p,animated: false,completion: nil)

    }
    
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
