//
//  CartTableViewController.swift
//  FinalProject
//
//  Created by 钟仁毅 on 2020/5/7.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

protocol AddItemToCartDelegate {
    func addToCart(name:String,price:String)
}

class CartTableViewController: UITableViewController,AddItemToCartDelegate {
    func addToCart(name:String,price:String) {
        let array = ["name":"\(name)","price":"\(price)"]
        dishes.append(array)
        navigationController?.tabBarItem.badgeValue = "\(dishes.count)"
        dishes.reverse()
    }
    
    var dishes:[[String:String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    @IBAction func submitPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "恭喜您，选菜完成", message: "是否确认您的订单", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .destructive, handler: {action in
            self.dishes.removeAll()
            self.tableView.reloadData()
            
        })
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert,animated: true,completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dishes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartItem", for: indexPath)

        cell.textLabel?.text = dishes[indexPath.row]["name"]!
        cell.detailTextLabel?.text = dishes[indexPath.row]["price"]!
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dishes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

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
