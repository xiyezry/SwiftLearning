//
//  DishesTableViewController.swift
//  FinalProject
//
//  Created by 钟仁毅 on 2020/5/6.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class DishesTableViewController: UITableViewController {

    var restaurant:String?
    var queryResult:[[String:AnyObject]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sqlite = SQLiteManager.sharedInstance
        sqlite.openDB()
        queryResult = sqlite.execQuerySQL(sql: "SELECT * FROM dishes WHERE restaurant = '\(restaurant!)';")
        sqlite.closeDB()

        // Uncomment the following line to preserve selection between presentation
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (queryResult?.count)!
    }



    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishes", for: indexPath)
        cell.textLabel?.text = queryResult?[indexPath.row]["name"]! as? String
        cell.detailTextLabel?.text = queryResult?[indexPath.row]["price"]! as? String
        cell.imageView?.image = DB.LoadImage(name: (queryResult?[indexPath.row]["name"]! as? String)!)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? DetailsPageViewController else
        {return}
        if let indexPath = tableView.indexPathForSelectedRow{
            detailsViewController.dishes = queryResult?[indexPath.row]["name"]! as? String
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
