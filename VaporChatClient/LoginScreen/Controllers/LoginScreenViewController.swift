//
//  ViewController.swift
//  VaporChat
//
//  Created by Ilya on 30.06.22.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    var mainView: LoginScreenView { return self.view as! LoginScreenView}

    override func loadView() {
        self.view = LoginScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

