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
                
            }
            
        }
        
        // ...
           // after login is done, maybe put this in the login web service completion block

           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let mainTabBarController = storyboard.instantiateViewController(identifier: "TabBarController")
           
           // This is to get the SceneDelegate object from your view controller
           // then call the change root view controller function to change to main tab bar
           (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    
}
