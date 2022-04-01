//
//  DetailsViewController.swift
//  internProject
//
//  Created by Pavan D J on 01/04/22.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var detailsLabelField: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usnLabel: UILabel!
    @IBOutlet weak var cgpaLabel: UILabel!
    @IBOutlet weak var branchLabel: UILabel!
    
    
    var name : StudentModel?
    var branch : StudentModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "\(String(describing: name?.name!))"
        branchLabel.text = "\(String(describing: branch?.branch!))"
        
     

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
