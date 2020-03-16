//
//  MineVC.swift
//  SoulMate
//
//  Created by Apui on 2020/3/15.
//  Copyright © 2020 陈沛. All rights reserved.
//

import UIKit

class MineVC: UIViewController {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var seeMyPageButton: UIButton!
    
    @IBOutlet weak var fansLabel: UILabel!
    @IBOutlet weak var fansNumberLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followingNumberLabel: UILabel!
    
    @IBOutlet weak var settingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
    }
    
    func setUpElements() {
        
        Utilities.circleTheImageView(headImageView)
        
//        Utilities.styleFilledButton(seeMyPageButton)
        
//        Utilities.styleFilledButton(settingButton)
        
        
    }

    
    @IBAction func seeMyPageButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        
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
