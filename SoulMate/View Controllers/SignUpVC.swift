//
//  SignUpVC.swift
//  SoulMate
//
//  Created by Apui on 2020/3/15.
//  Copyright © 2020 陈沛. All rights reserved.
//

import UIKit
import LeanCloud

class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var HeadImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
        //点击头像
        //这里为什么是self呢？为什么不是HeadImageView
        let imgTap = UITapGestureRecognizer(target: self, action: #selector(loadImg))
        imgTap.numberOfTapsRequired = 1
        imgTap.numberOfTouchesRequired = 1
        HeadImageView.isUserInteractionEnabled = true
        HeadImageView.addGestureRecognizer(imgTap)
        
    }
    
    func setUpElements() {
        
        Utilities.circleTheImageView(HeadImageView)
        
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
            
            /* 尝试上传图片失败
             let avaData = HeadImageView.image?.jpegData(compressionQuality: 0.5)
             let headImageFile = LCFile(payload: .data(data: avaData!))
             
            let url = Bundle.main.url(forResource: "3", withExtension: "jpg")
            let headImageFile = LCFile(payload: .fileURL(fileURL: url!))
            user["avaHeadImage"] = headImageFile
              */
            
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
    
    
    //单击头像，单单是这个方法还不行（该方法只能弹出照片库，而点击选择后不会更新imageView中去
    @objc func loadImg(recognizer: UITapGestureRecognizer) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        //允许用户对所选的照片进行裁剪编辑
        imagePicker.allowsEditing = true
        present(imagePicker,animated: true, completion: nil)
    }
    
    //关联选择好的照片图像到image view
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //从参数传递进来的info字典中提取image，并将提取出来的image赋值给avaImg对象
        HeadImageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        //关闭照片获取器
        self.dismiss(animated: true, completion: nil)
    }
    
    //用户取消获取器操作时调用的方法
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

