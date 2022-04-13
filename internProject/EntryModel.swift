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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//    func save(object:[String:String]){
//
//        let entityName = NSEntityDescription.insertNewObject(forEntityName: "Studentlist", into: context) as! Studentlist
//
//        entityName.name = object["name"]
//        entityName.branch = object["branch"]
//        entityName.cgpa = object["cgpa"]
//        entityName.usn = object["usn"]
//
//        do {
//            try context.save()
//            print("contents are saved")
//        }catch{
//            print("data is not saved")
//        }
//
//    }
//
    
    func save(object: Student){
    
        let entityName = NSEntityDescription.insertNewObject(forEntityName: "Studentlist", into: context) as! Studentlist

        entityName.name = object.name
        entityName.branch = object.branch
        entityName.id = object.id
        
        do {
            try context.save()
            print("contents are saved")
        }catch{
            print("data is not saved")
        }
       
    }
    
    
    
    func getStudentData() -> [Student]{
        
        var studentArray = [Student]()
        
        var cdstudent : [Studentlist] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Studentlist")
        do {
            cdstudent = try context.fetch(fetchRequest) as! [Studentlist]
            cdstudent.forEach{ st in
                let student = Student(id: st.id, name: st.name, branch: st.branch)
                studentArray.append(student)
            }
            print("data obtained successfully")
        }catch{
            print("can not get data")
        }
        return studentArray
    }
    
}
