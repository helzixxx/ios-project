//
//  ViewController.swift
//  MessengerTutorial
//
//  Created by Olya on 18.05.2022.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let IsLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")

        if !IsLoggedIn{
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }


}

