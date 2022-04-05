//
//  EntryModel.swift
//  internProject
//
//  Created by Pavan D J on 04/04/22.
//

import Foundation
import CoreData
import UIKit

class EntryModel {
    
    static var shareInstance = EntryModel()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Studentlist", into: context!) as! Studentlist
        
        student.name = object["name"]
        student.usn = object["usn"]
        student.cgpa = object["cgpa"]
        student.branch = object["branch"]
        do{
            try context?.save()
            print("Contents saved Successfully")
        }catch{
            print("Data is not saved")
        }
        
        func getStudentData() -> [Studentlist]{
            var student = [Studentlist]()
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Studentlist")
            do {
                student = try context?.fetch(fetchRequest) as! [Studentlist]
            }catch {
                print("Cannot get Data")
            }
            return student
        }
        
    }
   
        
    
    
    
}
