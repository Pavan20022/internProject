//
//  StudentManager.swift
//  internProject
//
//  Created by Pavan D J on 18/04/22.
//

import Foundation
import CoreData

struct StudentManager
{
    private let _studentDataRepository = StudentDataRepository()
    func createStudent(student: Student) {
        _studentDataRepository.create(student: student)
        
    }
    func fetchStudent() -> [Student]? {
        return _studentDataRepository.getAll()
    }
    func updateStudent(student: Student) -> Bool {
        return _studentDataRepository.update(student: student)
    }
    func deleteEmployee(student: Student) -> Bool {
        return _studentDataRepository.delete(record: student)
    }
}
