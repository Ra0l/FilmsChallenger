//
//  LoginViewController.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func showLoginError(_ message: String)
}

class LoginViewController: UIViewController {
    var presenter: LoginPresenterProtocol?
    
    private let imgLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Iniciar Sesion"
        label.font = .systemFont(ofSize: .init(30), weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameTextField: EmailTextField = {
        let textField = EmailTextField()
        textField.placeholder = "Usuario"
        textField.text = "Admin"
        textField.border_width = 2
        textField.layer.cornerRadius = 10
        textField.border_color = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: PasswordTextField = {
        let textField = PasswordTextField()
        textField.placeholder = "Contraseña"
        textField.text = "Password*123"
        textField.border_width = 2
        textField.layer.cornerRadius = 10
        textField.border_color = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Iniciar Sessión", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setActions()
    }
    
    private func initView() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(imgLogo)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            
            imgLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            imgLogo.heightAnchor.constraint(equalToConstant: 200),
            imgLogo.widthAnchor.constraint(equalToConstant: 200),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imgLogo.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    func setActions() {
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    @objc private func didTapLoginButton() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
        
        presenter?.loginButtonPressed(username: username, password: password)
    }

}

extension LoginViewController: LoginViewProtocol {
    func showLoginError(_ message: String) {
        let alertController = UIAlertController(title: "Fallo en la autenticación",
                                                message: message,
                                                preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Intentar de nuevo", style: .default, handler: nil)
        alertController.addAction(dismiss)
        present(alertController, animated: true, completion: nil)
    }
}
