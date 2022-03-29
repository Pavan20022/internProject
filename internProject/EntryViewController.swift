//
//  EntryViewController.swift
//  internProject
//
//  Created by Pavan D J on 29/03/22.
//

import UIKit

// MARK: - AddStudentDelegate Protocol

protocol AddStudentDelegate {
    func addStudent (student: Student)
}

class EntryViewController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: AddStudentDelegate?
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full Name"
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        view.addSubview(textField)
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        textField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    @objc func handleDone() {
        
        guard let fullname = textField.text, textField.hasText else {
            print("Handle error here..")
            return
        }
        
        let student = Student(fullname: fullname)
        
        delegate?.addStudent(student: student)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }

}
