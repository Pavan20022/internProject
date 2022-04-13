//
//  FavoriteTableViewController.swift
//  internProject
//
//  Created by Panchami Rao on 11/04/22.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    let studentModel = StudentModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        studentModel.loadItems()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentModel.numberOfItems()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        let student = studentModel.getItem(index: indexPath.row)
        
        cell.textLabel?.text = student.name
        cell.detailTextLabel?.text = student.branch
        
        return cell
    }


 

}
