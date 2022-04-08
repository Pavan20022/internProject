//
//  FavViewController.swift
//  internProject
//
//  Created by Pavan D J on 07/04/22.
//

import UIKit

class FavViewController: UIViewController {

   

    @IBOutlet weak var favTableView: UITableView!
    
    
    var student = [Studentlist]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student = EntryModel.shareInstance.getStudentData()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
   }
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavTableViewCell", for: indexPath) as! FavTableViewCell
        cell.nameLabel.text = student[indexPath.row].name
        cell.cgpaLabel.text = student[indexPath.row].cgpa
        cell.usnLabelField.text = student[indexPath.row].usn
        cell.branchLabel.text = student[indexPath.row].branch
        return cell
    }
    
 //     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     //   return 110
  //  }
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
