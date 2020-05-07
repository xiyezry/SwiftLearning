//
//  DetailsPageViewController.swift
//  FinalProject
//
//  Created by 钟仁毅 on 2020/5/7.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class DetailsPageViewController: UIViewController {
    var dishes:String?
    var queryResult:[[String:AnyObject]]?
    
    var addToCartDelegate:AddItemToCartDelegate?
    
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let sqlite = SQLiteManager.sharedInstance
        sqlite.openDB()
        queryResult = sqlite.execQuerySQL(sql: "SELECT * FROM dishes WHERE name = '\(dishes!)';")
        sqlite.closeDB()
        imgview.image = DB.LoadImage(name: (queryResult?[0]["name"]! as? String)!)
        nameLabel.text = queryResult?[0]["name"]! as? String
        priceLabel.text = queryResult?[0]["price"]! as? String
        descriptionLabel.text = queryResult?[0]["description"]! as? String
        
        let nav = tabBarController?.viewControllers?[1] as? UINavigationController
        let secnav = nav?.viewControllers.first as? CartTableViewController
        addToCartDelegate = secnav
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToCartPressed(_ sender: UIBarButtonItem) {
        let name = nameLabel.text!
        let price = priceLabel.text!
        //print(price)
        addToCartDelegate?.addToCart(name: name, price: price)
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
