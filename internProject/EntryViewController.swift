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
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usnTextField: UITextField!
    @IBOutlet weak var cgpaTextField: UITextField!
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
        
        refStudents.child(key!).setValue(students) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Message saved Successfully")
                print(reference)
                
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
        navigationController?.popViewController(animated: true)
        
        //EntryModel.shareInstance.save(object: dict as! [String : String])
        
    }
    
    
}
