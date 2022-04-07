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
    func save(object:[String:String]){
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Studentlist", into: context!) as! Studentlist
        
        student.name = object["name"]
        student.branch = object["branch"]
        student.cgpa = object["cgpa"]
        student.usn = object["usn"]
        
        do {
            try context?.save()
        }catch{
            print("data is not saved")
        }
        
        
    }
    
    
}
