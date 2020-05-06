//
//  SearchResultTableViewController.swift
//  S0801
//
//  Created by 钟仁毅 on 2020/4/15.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class SearchResultTableViewController: UITableViewController ,UISearchResultsUpdating{
    
    
    var allStudent:[Student] = []
    var filterStudents:[Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MasterCell")

    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else {return}
        if searchString.isEmpty{return}
        
        switch searchController.searchBar.selectedScopeButtonIndex{
            case 0:
                filterStudents = allStudent.filter{(stu)->Bool in
                    return stu.name.contains(searchString)||stu.address.contains(searchString)}
            case 1:
                filterStudents = allStudent.filter{(stu) ->Bool in
                    return stu.name.contains(searchString)}
            case 2:
                filterStudents = allStudent.filter{(stu)->Bool in
                    return stu.address.contains(searchString)}
            default:
                return
        }
        tableView.reloadData()
        
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterStudents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterCell", for: indexPath)

        cell.textLabel?.text = filterStudents[indexPath.row].name

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        let mainstoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = mainstoryboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        let nav = self.presentingViewController?.navigationController
        detailVC.student = filterStudents[indexPath.row]
        detailVC.isAdd = false
        nav?.pushViewController(detailVC, animated: true)
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
