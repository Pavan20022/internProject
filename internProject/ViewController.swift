//
//  ViewController.swift
//  internProject
//
//  Created by Pavan D J on 18/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLogin", sender: self)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        performSegue(withIdentifier:"goToRegister",sender: self)
        
    }
    
    override func prepare(for segue:UIStoryboardSegue,sender: Any?){
        
        }
            
            
    }




