//
//  FavViewController.swift
//  internProject
//
//  Created by Pavan D J on 07/04/22.
//

import UIKit

class FavViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var favTableView: UITableView!
    
    @IBOutlet weak var viewSearch: UISearchBar!
    let studentModel = StudentModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favTableView.dataSource = self
        favTableView.delegate = self
        favTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        studentModel.loadItems()
        favTableView.reloadData()
    }
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentModel.numberOfItems()
   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        let student = studentModel.getItem(index: indexPath.row)
        
        cell.textLabel?.text = student.name
        cell.detailTextLabel?.text = student.branch
        
        return cell
    }


}
