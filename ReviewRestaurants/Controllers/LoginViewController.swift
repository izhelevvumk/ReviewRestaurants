//
//  LoginViewController.swift
//  ReviewRestaurants
//
//  Created by Ivaylo Zhelev on 22.02.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var proceedButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: Actions
    
    @IBAction func login(_ sender: Any) {
//        let restsArray: [Restaurant] = [Restaurant(name: "BlaBlaBla"), Restaurant(name: "BlaBlaBla")]
//
//        DatabaseManager.shared.insertRestaurants(restsArray)
        
        let rests = DatabaseManager.shared.restaurantsFromDb()
        
        return
        
        
//        for user in users {
//            if emailTextField.text == user.email && passwordTextField.text == user.password {
//                self.performSegue(withIdentifier: kGoToSecondScreenSegue, sender: self)
//                return
//            }
//        }
    }
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DashboardViewController {
            
            controller.mainLabelText = "We passed some info, hehe"
        }
        else if let controller = segue.destination as? CreateAccountViewController {
            controller.registrationDelegate = self
        }
    }
    
    // MARK: Constants
    
    let kGoToSecondScreenSegue: String = "goToSecondController"
    
    
    // MARK: Variables
    
    var users: [User] = []
    
    
    // MARK: Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.placeholder = NSLocalizedString("EMAIL", comment: "") 
        
        proceedButton.setTitle("MY NEW BUTTON TITLE", for: .normal)
        // Do any additional setup after loading the view.
        
    }
}

extension LoginViewController: DashboardViewControllerDelegate {
    
    func returnString(_ string: String) {
        self.emailTextField.text = string
    }
}

extension LoginViewController: RegistrationDelegate {
    func didSaveNewUser(_ user: User) {
        users.append(user)
    }
}
