//
//  AuthViewController.swift
//  VKNews
//
//  Created by Lev Kolesnikov on 15.08.2019.
//  Copyright © 2019 Lev Kolesnikov. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        authService = AppDelegate.shared().authService
    }
    

    @IBAction func signInTouch() {
        authService.wakeUpSession()
    }
    
}
