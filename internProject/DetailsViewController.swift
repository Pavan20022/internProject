//
//  DetailsViewController.swift
//  internProject
//
//  Created by Pavan D J on 01/04/22.
//

import UIKit
import Firebase

class DetailsViewController: UIViewController{
  
    @IBOutlet weak var detailsLabelField: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usnLabel: UILabel!
    @IBOutlet weak var cgpaLabel: UILabel!
    @IBOutlet weak var branchLabel: UILabel!
    
    //var student : StudentModel?
   var student = [Studentlist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        student = EntryModel.shareInstance
        
        
        //nameLabel.text = "\(String(describing: (student?.name)))"
        //branchLabel.text = "\(String(describing: (student?.branch)))"
        //  let refStudents = Database.database().reference().child("students")
        
      //  var studentlists = [StudentModel]()
        
       // refStudents.observe(DataEventType.value, with:{(DataSnapshot) in
                                
          //  if DataSnapshot.childrenCount > 0{
             //   self.studentlists.removeAll()
            
             //   for students in DataSnapshot.children.allObjects as! [DataSnapshot] {
             //       let studentObject = students.value as?  [String: AnyObject]
             //       let studentName = studentObject?["studentName"]
             //       let branchName = studentObject?["branchName"]
             //
            //        let studentId = studentObject?["id"]
                    
             //       let student = StudentModel(id: studentId as! String?, name: studentName as! String?, branch: branchName as! String?)
                    
              //      self.studentlists.append(student)
                    
                }
                    
                
                
            
    
        
     

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    }
    

