//
//  MasterTableViewController.swift
//  S0801
//
//  Created by 钟仁毅 on 2020/4/15.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    let jsonClass = JsonFileManager<Student>(filename: "students")
    var searchcontroller:UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonClass.Load()
        initSearch()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func initSearch(){
        let resultsController = SearchResultTableViewController()
        resultsController.allStudent = self.jsonClass.Records
        
        searchcontroller = UISearchController(searchResultsController: resultsController)
        let searchBar = searchcontroller.searchBar
        searchBar.scopeButtonTitles=["所有","姓名","地址"]
        searchBar.placeholder = "Enter a search item"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        searchcontroller.searchResultsUpdater = resultsController
        self.definesPresentationContext = true
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jsonClass.Records.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterCell", for: indexPath)
        let stu = jsonClass.Records[indexPath.row]
        cell.textLabel?.text = stu.name
        cell.detailTextLabel?.text = stu.address
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
            
            jsonClass.Records.remove(at: indexPath.row)
            jsonClass.Save()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController else{return}
        
        if segue.identifier == "Edit"{
            if let indexPath = tableView.indexPathForSelectedRow{
                detailViewController.student = jsonClass.Records[indexPath.row]
                detailViewController.isAdd = false
            }
        }
        else if segue.identifier == "Add"{
            detailViewController.student = Student()
            detailViewController.isAdd = true
        }
    }
    
    @IBAction func prepareForUnwind(segue:UIStoryboardSegue)
    {
        guard let detailViewController = segue.source as? DetailViewController else {return}
        
        if detailViewController.isAdd == true{
            jsonClass.Records.append(detailViewController.student!)
        }
        jsonClass.Save()
    }
}
