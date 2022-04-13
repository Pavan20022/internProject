//
//  StudentModel.swift
//  internProject
//
//  Created by Pavan D J on 30/03/22.
//

import Foundation


class Student {
    
    var id: String?
    var name: String?
    var branch: String?
    
    init(id:String?,name:String?,branch:String?) {
        self.id = id
        self.name = name
        self.branch = branch
    }
}

class StudentModel {
    var studentlist = [Student]()
    
    func loadItems() {
        self.studentlist = EntryModel.shareInstance.getStudentData()
    }
    
    func getItems() -> [Student] {
        return studentlist
    }
    
    func getItem(index : Int) -> Student{
        return studentlist[index]
    }
    
    func numberOfItems() -> Int {
        return studentlist.count
    }
    
}





class StudentDetail {
    var studentName: String
    var studentUsn: String
    var studentBranch: String
    var studentCgpa: String
    
    init(name: String, usn: String, branch: String, cgpa: String) {
        self.studentName = name
        self.studentUsn = usn
        self.studentBranch = branch
        self.studentCgpa = cgpa
    }
}

class StudentDetailModel {
    var studentDetail: StudentDetail?
    
    func loadItem(name: String, usn: String, branch: String, cgpa: String) {
        studentDetail = StudentDetail(name: name, usn: usn, branch: branch, cgpa: cgpa)
    }
    
    func getItem() -> StudentDetail? {
        guard let student = studentDetail else {return nil}
        return student
    }
}
