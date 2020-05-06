//
//  ThirdTableViewController.swift
//  S0701
//
//  Created by 钟仁毅 on 2020/4/1.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class ThirdTableViewController: UITableViewController {

    let products = [
           ["name":"金32","detail":"金士顿24G"],
           ["name":"金16","detail":"金士顿16G"],
           ["name":"爱32","detail":"爱国者32G"],
           ["name":"爱24","detail":"爱国者24G"],
           ["name":"爱16","detail":"爱国者16G"],
           ["name":"爱16","detail":"爱国者16G"],
       ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "cell3")
        tableView.rowHeight = 130
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = products[indexPath.row]["name"]
        cell.detailLabel.text = products[indexPath.row]["detail"]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
