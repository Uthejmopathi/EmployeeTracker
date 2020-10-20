//
//  LoginPageViewController.swift
//  EmployeesApp
//
//  Created by Uthej Mopathi on 10/20/20.
//

import UIKit

class LoginPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var usernamesForAccess: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        if (usernameTextField.text == "abc" && passwordTextField.text == "abc") || (usernameTextField.text == "pqr" && passwordTextField.text == "pqr") ||
            (usernameTextField.text == "def" && passwordTextField.text == "def") {
            usernamesForAccess = usernameTextField.text!
            performSegue(withIdentifier: "InitialSegue", sender: nil)
        }
        else {
            let alertController = UIAlertController(title: "Warning",
                                                           message: "Incorrect Credentials",
                                                           preferredStyle: UIAlertController.Style.alert)
                   let alertAction = UIAlertAction(title: "Ok",
                                                   style: UIAlertAction.Style.default, handler: nil)
                   alertController.addAction(alertAction)
                   present(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? ViewController
        destinationVC!.recievedUserName = usernameTextField.text
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