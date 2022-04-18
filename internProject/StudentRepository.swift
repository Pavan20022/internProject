//
//  StudentRepository.swift
//  internProject
//
//  Created by Pavan D J on 14/04/22.
//

import Foundation
import CoreData

protocol StudentRepository {
    
    func create(student: Student)
    func getAll() -> [Student]?
    func get(byIdentifier id: String) -> Student?
    func update(student: Student) -> Bool
    func delete(record: Student) -> Bool
    
}

struct StudentDataRepository : StudentRepository{
    
    func get(byIdentifier id: String) -> Student? {
        let fetchRequest = NSFetchRequest<Studentlist>(entityName: "Studentlist")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            
            guard result != nil else { return nil }
            
            return result?.convertToStudent()
            
        }catch let error {
            debugPrint(error)
        }
        
        return nil
        
    }
    
    
    func getAll() -> [Student]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: Studentlist.self)
        
    var students : [Student] = []
    
    result?.forEach({ (Studentlist) in
     
        students.append(Studentlist.convertToStudent())
    })
    
    return students
        }
    
    func create(student: Student) {
        let cdstudent = Studentlist(context: PersistentStorage.shared.context)
        cdstudent.name = student.name
        cdstudent.branch = student.branch
        cdstudent.id = student.id
        PersistentStorage.shared.saveContext()
    }
    
    func update(student: Student) -> Bool  {
        let cdStudent = get(byIdentifier: student.id!)
        guard  cdStudent != nil else { return false }
        
        cdStudent?.name = student.name
        cdStudent?.branch = student.branch
        cdStudent?.id = student.id
        
        PersistentStorage.shared.saveContext()
        
       return true
        
    }
    
    func delete(record: Student) -> Bool {
        let cdStudent = get(byIdentifier: record.id!)
        guard  cdStudent != nil else { return false }
     //   PersistentStorage.shared.context.delete(cdStudent)
        return true
    }
    
    
}
    

