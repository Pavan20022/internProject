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
    
    var selectedStudentId : String? = nil
    
    @IBOutlet var tableStudent: UITableView!
    
    
    var studentlist = [StudentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableStudent.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        retrieveData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // If already logged in directly show the list view controller
        
//        if Auth.auth().currentUser?.uid == nil {
//            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
//
//                navigationController?.pushViewController(vc, animated: true)
//
//                //self.present(vc, animated: true, completion: nil)
//
//                tabBarController?.tabBar.isHidden = true
//
//            }
//
//        }
        // If not bring up login screen
        
       
        
    }
    
    
    
    
  
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToTab", sender: self)
        
//        let student = studentlist[indexPath.row]
//        selectedStudentId = student.id
//
//        let alertController = UIAlertController(title: student.name,message: student.branch,preferredStyle: .alert)
//        let detailAction = UIAlertAction(title: "View Details", style: .default){(action) in
//            // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//            // let newStudent = Studentlist(context: context)
//        }
//        alertController.addAction(detailAction)
//        present(alertController, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "goToTab"){
            if let destination = segue.destination as? DetailsViewController{
                destination.selectedStudent = studentlist[(tableStudent.indexPathForSelectedRow?.row)!]
                tableStudent.deselectRow(at: tableStudent.indexPathForSelectedRow!, animated: true)
            }
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
