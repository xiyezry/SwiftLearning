//
//  ToolBarPageViewController.swift
//  0601
//
//  Created by 钟仁毅 on 2020/4/1.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class ToolBarPageViewController: UIViewController {

    @IBOutlet weak var ContentView: UIView!
    
    let vc1 = UIViewController()
    let vc2 = UIViewController()
    let vc3 = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vc1.view.backgroundColor = UIColor.red
        vc2.view.backgroundColor = UIColor.green
        vc3.view.backgroundColor = UIColor.blue
        
        self.addChild(vc1)
        self.addChild(vc2)
        self.addChild(vc3)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonPressed(_ sender: UIBarButtonItem) {
        let text = sender.title
        switch text {
        case "红色":
            ContentView.addSubview(vc1.view)
        case "绿色":
            ContentView.addSubview(vc2.view)
        case "蓝色":
            ContentView.addSubview(vc3.view)
        default:
            return
        }
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
