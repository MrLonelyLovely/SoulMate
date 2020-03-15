//
//  LoginVC.swift
//  SoulMate
//
//  Created by Apui on 2020/3/15.
//  Copyright © 2020 陈沛. All rights reserved.
//

import UIKit
import LeanCloud

class LoginVC: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleTextField(userNameTextField)
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(loginButton)
    }

    @IBAction func loginButtonTapped(_ sender: Any) {

        _ = LCUser.logIn(username: userNameTextField.text!, password: passwordTextField.text!) { result in
            switch result {
            case .success(object: let user):
                print("login successed")
                self.transitiontoHome()
                
            case .failure(error: let error):
                print(error)
                let alert = UIAlertController(title: "Oops!!!", message: "账号或密码错误，请重新输入", preferredStyle: .alert)
                let ok = UIAlertAction(title: "好的惹", style: .cancel) { (action) in
                    self.userNameTextField.text = nil
                    self.passwordTextField.text = nil
                }
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    func transitiontoHome() {
        let homeTabBarController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeTabBarController) as! MyTabBarController
        view.window?.rootViewController = homeTabBarController
        view.window?.makeKeyAndVisible()
    }

}
