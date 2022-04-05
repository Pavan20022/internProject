//
//  ListViewController.swift
//  internProject
//
//  Created by Pavan D J on 21/03/22.
//

import UIKit
import Firebase


// MARK: Contact


class ListViewController: UITableViewController {
    
    var refStudentEntry: DatabaseReference!
    
    var refStudents : DatabaseReference!
    
    @IBOutlet var tableStudent: UITableView!
    
    
    var studentlist = [StudentModel]()
  
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let student = studentlist[indexPath.row]
        
        let alertController = UIAlertController(title: student.name,message: student.branch,preferredStyle: .alert)
        
        let detailAction = UIAlertAction(title: "View Details", style: .default){(action) in
            self.performSegue(withIdentifier: "goToTab", sender: self)
            
           // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
           // let newStudent = Studentlist(context: context)
                }
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
                    
                    //getting artist id
                    let id = student.id
                    
                    //getting new values
                    let name = alertController.textFields?[0].text
                    let branch = alertController.textFields?[1].text
                    
                    //calling the update method to update artist
            self.updateStudent(id: id!, name: name!, branch:branch!)
                }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Delete Current Detail", style: .cancel) { (action) in
            self.deleteStudent(id: student.id!)
        }
        
        alertController.addTextField { (textField) in
            textField.text = student.name
        }
        alertController.addTextField { (textField) in
            textField.text = student.branch
        }
        
        
        
        alertController.addAction(detailAction)
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        
        present(alertController, animated: true, completion: nil)
    
    }
    
    func deleteStudent(id:String){
        refStudents.child(id).setValue(nil)
    }
    func updateStudent(id:String,name:String,branch:String) {
        
        let student = ["id":id,"studentName": name,"studentBranch":branch]
        
        refStudents.child(id).setValue(student)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            
            destination.student = studentlist[(tableStudent.indexPathForSelectedRow?.row)!]
            
            tableStudent.deselectRow(at: tableStudent.indexPathForSelectedRow!, animated: true)
        }
    }
    

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return studentlist.count
    }

    
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell",for: indexPath) as! CustomTableViewCell
        
        let student: StudentModel
        
        student = studentlist[indexPath.row]
        
        cell.textLabel?.text = student.name
        cell.detailTextLabel?.text = student.branch
        
       // cell.labelName.text = student.name
        //cell.labelBranch.text = student.branch
        
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refStudents = Database.database().reference().child("students")
        
        retrieveData()
        
        tableStudent.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        
     
        
    }
    
    func retrieveData() {
        
        let refStudents = Database.database().reference().child("students")
        
        
        
        refStudents.observe(DataEventType.value, with:{(DataSnapshot) in
                                
            if DataSnapshot.childrenCount > 0{
                self.studentlist.removeAll()
                
                for students in DataSnapshot.children.allObjects as! [DataSnapshot] {
                    let studentObject = students.value as?  [String: AnyObject]
                    let studentName = studentObject?["studentName"]
                    let branchName = studentObject?["branchName"]
                    let studentId = studentObject?["id"]
                    
                    let student = StudentModel(id: studentId as! String?, name: studentName as! String?, branch: branchName as! String?)
                    
                    self.studentlist.append(student)
                    
                }
                
                self.tableStudent.reloadData()
                
            }
            
    })
  
        
        
    }

    //override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       // return 0
   // }
    

    
    
    //MARK - TableView Delegate
    
    //override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
   // }

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
    //@IBAction func logOutPressed(_ sender: Any) {
        //do{
          //  try Auth.auth().signOut()
            
        //}catch {
           // print("error: there was a problem signing out")
        //}
        
        //guard (navigationController?.popToRootViewController(animated: true)) != nil else {
           // print("No View controllers to pop off")
           // return
      //  }
            
        
    //}
    
    //MARK- ADD NEW ITEM
//}
    
//}

}
