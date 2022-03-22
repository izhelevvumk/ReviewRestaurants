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
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    // MARK: Actions
    
    
    @IBAction func proceed(_ sender: Any) {
        self.performSegue(withIdentifier: kGoToSecondScreenSegue, sender: self)
    }
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DashboardViewController {
            
            controller.mainLabelText = "We passed some info, hehe"
        }
    }
    
    // MARK: Constants
    
    let kGoToSecondScreenSegue: String = "goToSecondController"
    
    
    // MARK: Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proceedButton.setTitle("MY NEW BUTTON TITLE", for: .normal)
        // Do any additional setup after loading the view.
    }
}

extension LoginViewController: DashboardViewControllerDelegate {
    
    func returnString(_ string: String) {
        self.usernameTextField.text = string
    }
}
