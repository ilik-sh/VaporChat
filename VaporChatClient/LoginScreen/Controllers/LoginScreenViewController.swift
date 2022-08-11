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
        mainView.onLoginAction = {[weak self] in self?.loginAction()}
    }
    
    @objc
    func loginAction() {
        print("dsa")
        let vc = ChatScreenViewController()
        guard let name = mainView.getUsername() else { return }
        let user = User(name: name)
        vc.user = user
        if navigationController?.topViewController != vc {
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}

