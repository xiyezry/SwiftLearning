//
//  HomeViewController.swift
//  FinalProject
//
//  Created by 钟仁毅 on 2020/5/6.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        DB.initDB()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let restaurantTableViewController = segue.destination as? RestaurantTableViewController else
        {return}
        if segue.identifier == "chuan"{
            restaurantTableViewController.type = "川菜"
        }
        else if segue.identifier == "lu"{
            restaurantTableViewController.type = "鲁菜"
        }
        else if segue.identifier == "xiang"{
            restaurantTableViewController.type = "湘菜"
        }
        else if segue.identifier == "yue"{
            restaurantTableViewController.type = "粤菜"
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
