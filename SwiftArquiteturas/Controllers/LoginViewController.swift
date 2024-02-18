//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Jose Luiz Bento da Silva on 18/02/24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func registerButtonTap(_ sender: Any) {
        let register = self.storyboard? .instantiateViewController(
            withIdentifier: "registerViewController") as! RegisterViewController

        
        register.modalPresentationStyle = .fullScreen
        self.present(register, animated: true)
    }
    
   
    
    @IBAction func openButtontap(_ sender: Any) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            
            manager.login(email: email, password: password) { userModel in
                self.openHomeView()
                
                
            } failureHandler: { error in
                self.showMessage(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func openHomeView() {
        let homeView = self.storyboard? .instantiateViewController(
            withIdentifier: "homeViewController") as! HomeViewController
        
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
}
