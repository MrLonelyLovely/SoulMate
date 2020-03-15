//
//  SignUpVC.swift
//  SoulMate
//
//  Created by Apui on 2020/3/15.
//  Copyright © 2020 陈沛. All rights reserved.
//

import UIKit
import LeanCloud

class SignUpVC: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
    }
    
    func setUpElements() {
        
        Utilities.styleTextField(userNameTextField)
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(signUpButton)
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        //隐藏keyboard
        self.view.endEditing(true)
        
        do {
            // 创建实例
            let user = LCUser()

            // 等同于 user.set("username", value: "Tom")
            user.username = LCString(userNameTextField.text!)
            user.password = LCString(passwordTextField.text!)

            //加括号以消除Ambiguous use of 'signUp'
            _ = user.signUp ({ (result) in
                switch result {
                case .success:
                    print("SignUp successed")
                    self.transitiontoHome()
                    break
                case .failure(error: let error):
                    print(error)
                }
            })
        } catch {
            print(error)
        }
        
    }
    
    func transitiontoHome() {
        let homeTabBarController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeTabBarController) as! MyTabBarController
        view.window?.rootViewController = homeTabBarController
        view.window?.makeKeyAndVisible()
    }
    
    
}
