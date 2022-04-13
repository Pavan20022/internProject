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
    
    let studentDetailModel = StudentDetailModel()
    var selectedStudent : Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func displayData() {
        if let student = studentDetailModel.getItem() {
            nameLabel.text = " Name: \(student.studentName)"
            usnLabel.text = " USN: \(student.studentUsn)"
            cgpaLabel.text = " CGPA: \(student.studentCgpa)"
            branchLabel.text = " Branch: \(student.studentBranch)"
        } else {
            print("Error loading data")
        }
    }
    
    func getData() {
        
        guard let studentId = selectedStudent?.id else {return}
        let refStudents = Database.database().reference().child("students").child(studentId)
        
        refStudents.observe(DataEventType.value, with:{(DataSnapshot) in
            
            if DataSnapshot.childrenCount > 0{
                let studentObject = DataSnapshot.value as?  [String: AnyObject]
                let studentName = studentObject?["studentName"]
                let branchName = studentObject?["branchName"]
                let studentUSN = studentObject?["studentUsn"]
                let studentCgpa = studentObject?["cgpa"]
                
                self.studentDetailModel.loadItem(name: studentName as! String, usn: studentUSN as! String, branch: branchName as! String, cgpa: studentCgpa as! String)
                self.displayData()
                
            }
            
        })
        
    }
    
    
    @IBAction func AddToFavourites(_ sender: Any) {
        EntryModel.shareInstance.save(object: selectedStudent!)
        // display an alert on successful addition
        let alertController = UIAlertController(title: "Success", message: "Student added to Favorites list successfully", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
//        if let favVc = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteTableViewController") as? FavoriteTableViewController {
//            self.navigationController?.pushViewController(favVc, animated: true)
//        }
    }
    
    
    
}
    


    

