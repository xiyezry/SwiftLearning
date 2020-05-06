//
//  FirstViewController.swift
//  S0701
//
//  Created by 钟仁毅 on 2020/4/1.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDataSource  {
    
    let products = [
        ["name":"金32","detail":"金士顿24G"],
        ["name":"金16","detail":"金士顿16G"],
        ["name":"爱32","detail":"爱国者32G"],
        ["name":"爱24","detail":"爱国者24G"],
        ["name":"爱16","detail":"爱国者16G"],
        ["name":"爱16","detail":"爱国者16G"],
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell1",for: indexPath)
        
        cell.textLabel?.text = products[indexPath.row]["name"]
        cell.detailTextLabel?.text = products[indexPath.row]["detail"]
        cell.imageView?.image = UIImage(named:"first")
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

