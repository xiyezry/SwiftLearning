//
//  FirstViewController.swift
//  P0902
//
//  Created by 钟仁毅 on 2020/4/21.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var addItemDelegate : AddItemDelegate?
    @IBAction func saveButtonTapped(_ sender : Any){
        let index = Int(arc4random_uniform(100))
        addItemDelegate?.addItem(index: index)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = tabBarController?.viewControllers?[1] as? UINavigationController
        let secondtab = nav?.viewControllers.first as? SecondTableViewController
        
        addItemDelegate = secondtab
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
