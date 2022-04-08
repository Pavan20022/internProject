//
//  FirstViewController.swift
//  internProject
//
//  Created by Pavan D J on 18/03/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func loginPressed(_ sender: UIButton) {
        //TODO: Log in the user
        
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { ( user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Login is successful")
                self.navigationController?.popViewController(animated: true)
                //self.performSegue(withIdentifier: "goToList", sender: self)
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}
