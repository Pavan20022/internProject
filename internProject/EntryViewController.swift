//
//  EntryViewController.swift
//  internProject
//
//  Created by Pavan D J on 29/03/22.
//

import UIKit
import Firebase



class EntryViewController: UIViewController {
    
    var refStudents : DatabaseReference!
    
    @IBOutlet weak var nameLabelField: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usnLabelField: UILabel!
    @IBOutlet weak var usnTextField: UITextField!
    @IBOutlet weak var cgpaLabelField: UILabel!
    @IBOutlet weak var cgpaTextField: UITextField!
    
    @IBOutlet weak var branchLabelField: UILabel!
    @IBOutlet weak var branchTextField: UITextField!
    

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refStudents = Database.database().reference().child("students")
        
        
     
        // Do any additional setup after loading the view.
    }
    
    func addStudent() {
        
        
        let refStudents = Database.database().reference().child("students")
        
        let key = refStudents.childByAutoId().key
        
        let students = ["id":key,"studentName":nameTextField.text! as String, "studentUsn":usnTextField.text!, "cgpa":cgpaTextField.text!, "branchName":branchTextField.text! as String]
        
        
        //refStudents.childByAutoId().setValue(students)
        //refStudents.child(key!).setValue(students)
        
        refStudents.childByAutoId().setValue(students) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Message saved Successfully")
                
            }
        }
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addEntry(_ sender: Any) {
        addStudent()
        let dict = ["name": nameTextField.text ,"usn": usnTextField.text,"cgpa":cgpaTextField.text,"branch":branchTextField.text]
        
        EntryModel.shareInstance.save(object: dict as! [String : String])
        
    }
    
    
}
