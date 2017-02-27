//
//  AppEntrySplashVC.swift
//  MathWars
//
//  Created by Yashim Greene on 2/12/17.
//  Copyright © 2017 Yashim Greene. All rights reserved.
//

import UIKit

class AppEntrySplashVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perform(#selector(AppEntrySplashVC.showNavController), with: nil, afterDelay: 1)
        
    }
    
    func showNavController() {
        
        performSegue(withIdentifier: "showAppEntrySplash", sender: self)
    }

}
