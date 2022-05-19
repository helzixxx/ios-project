//
//  LoginViewController.swift
//  MessengerTutorial
//
//  Created by Olya on 18.05.2022.
//

import UIKit

class LoginViewController: UIViewController {

    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()

    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let emailField : UITextField = {
        let emailField = UITextField()
        emailField.autocapitalizationType = .none //преобразование заглавных букв
        emailField.autocorrectionType = .no //автокорекция
        emailField.returnKeyType = .continue
        emailField.layer.cornerRadius = 12
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.lightGray.cgColor
        emailField.placeholder = "Email Address..."
        return emailField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log in"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action:  #selector(didTapRegister))

        //Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
    }

    //Это событие уведомляет контроллер представления о том, что подпредставления были настроены. то есть после того как сабвью загрузились мы берем значения фрэйма
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width - size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
    }


    @objc private func didTapRegister (){
        let vc = RegisterViewController()
        vc.title = "Create account"
        navigationController?.pushViewController(vc, animated: true)
    }

}


