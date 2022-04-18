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
        createStudent(object: selectedStudent!)
        // display an alert on successful addition
        let alertController = UIAlertController(title: "Success", message: "Student added to Favorites list successfully", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)

    }
    
    func createStudent(object : Student) {
        let student = Studentlist(context: PersistentStorage.shared.context)
        student.name = object.name
        student.branch = object.branch
        student.id = object.id
      //  do {
       //     try PersistentStorage.saveContext()
       //     print("contents are saved")
       // }catch{
          //  print("data is not saved")
       // }
    }
    
    func fetchStudent(){
        do {
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            debugPrint(path[0])
            guard let result = try PersistentStorage.shared.context.fetch(Studentlist.fetchRequest()) as? [Student] else {return}
            
            result.forEach({debugPrint($0.name)})
            result.forEach({debugPrint($0.branch)})
            result.forEach({debugPrint($0.id)})
            
        }catch let error {
            debugPrint(error)
        }
    
}
    
}

    

