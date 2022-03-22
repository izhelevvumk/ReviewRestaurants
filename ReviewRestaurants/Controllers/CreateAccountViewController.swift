//
//  CreateAccountViewController.swift
//  ReviewRestaurants
//
//  Created by Ivaylo Zhelev on 22.03.22.
//

import Foundation
import UIKit

class CreateAccountViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var nameLabel        : UILabel!
    @IBOutlet weak var emailLabel       : UILabel!
    @IBOutlet weak var passwordLabel    : UILabel!
    @IBOutlet weak var rePasswordLabel  : UILabel!
    
    @IBOutlet weak var nameTextField        : UITextField!
    @IBOutlet weak var emailTextField       : UITextField!
    @IBOutlet weak var passwordTextField    : UITextField!
    @IBOutlet weak var rePasswordTextFIeld  : UITextField!
    
    @IBOutlet weak var proceedButton: UIButton!
    
    
    // MARK: Actions
    
    @IBAction func proceed(_ sender: Any) {
        if isValid {
            self.navigationController?.popViewController(animated: true)
            registrationDelegate?.didSaveNewUser(User(name: nameTextField.text ?? "",
                                                      email: emailTextField.text ?? "",
                                                      password: passwordTextField.text ?? ""))
        }
        else {
            
        }
    }
    
    
    // MARK: Variables
    
    weak var registrationDelegate: RegistrationDelegate?
    
    // MARK: Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel       .text = "Name"
        emailLabel      .text = "Email"
        passwordLabel   .text = "Password"
        rePasswordLabel .text = "Enter password again"
        
        proceedButton.setTitle("Save", for: .normal)
        
        nameTextField       .delegate = self
        emailTextField      .delegate = self
        passwordTextField   .delegate = self
        rePasswordTextFIeld .delegate = self
    }
    
    
    // MARK: Private Methods
    
    var isValid: Bool {
        return  !(emailTextField.text?.isEmpty ?? true  ||
                nameTextField.text?.isEmpty ?? true     ||
                passwordTextField.text?.isEmpty ?? true ||
                passwordTextField.text != rePasswordTextFIeld.text)
    }
}

protocol RegistrationDelegate: AnyObject {
    func didSaveNewUser(_ user: User)
}

extension CreateAccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
