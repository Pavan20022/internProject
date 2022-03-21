//
//  ListViewController.swift
//  internProject
//
//  Created by Pavan D J on 21/03/22.
//

import UIKit
import Firebase

class ListViewController: UITableViewController {
    
    var itemArray = ["Pavan","Pareekshith","Rahul"]

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }

    // MARK: - Table view data source

    //override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       // return 0
   // }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemArray.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = itemArray[indexPath.row]

        return cell
    }
    
    //MARK - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
    @IBAction func logOutPressed(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            
        }catch {
            print("error: there was a problem signing out")
        }
        
        guard (navigationController?.popToRootViewController(animated: true)) != nil else {
            print("No View controllers to pop off")
            return
        }
            
        
    }
    
    //MARK- ADD NEW ITEM
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Enter the student name ", message: "", preferredStyle: .alert)
              
               let action = UIAlertAction(title: "Enter", style: .default) { (action) in
                
                self.itemArray.append(textField.text!)
                self.tableView.reloadData()
               }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Student Name"
            textField = alertTextField
            
        }
                
               alert.addAction(action)
           
           present(alert,animated:true,completion:nil)
          
           }
    
    
}


