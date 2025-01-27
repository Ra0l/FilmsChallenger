//
//  RegisterViewController.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/27/25.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {

    var coordinator: RegisterCoordinatorProtocol?
    
    private let backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_arrow_back.pdf")
        imageView.tintColor = UIColor.neutral100
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLogin: UILabel = {
        let label = UILabel()
        label.text = "Sign up now"
        label.font = UIFont.customFont(.semiBold, size: .heading3)
        label.textColor = UIColor.neutral100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLogin: UILabel = {
        let label = UILabel()
        label.text = "Please fill the details and create account"
        label.font = UIFont.customFont(.light, size: .heading5)
        label.textColor = UIColor.neutral60
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameTextField: LoginInputTextField = {
        let textField = LoginInputTextField()
        textField.configure(withPlaceholder: "Username", type: .personality)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailTextField: LoginInputTextField = {
        let textField = LoginInputTextField()
        textField.configure(withPlaceholder: "Email", type: .email)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: LoginInputTextField = {
        let textField = LoginInputTextField()
        textField.configure(withPlaceholder: "Password", type: .password)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let inputAllStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let quantityPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password must be 8 character"
        label.font = UIFont.customFont(.light, size: .bodySmallMedium)
        label.textColor = UIColor.neutral60
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginButton: PrimaryButton = {
        let button = PrimaryButton()
        button.configure(title: "Sign Up", status: .disabled)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let haventAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account"
        label.font = UIFont.customFont(.light, size: .bodyMediumMedium)
        label.textColor = UIColor.neutral60
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signUpAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.font = UIFont.customFont(.semiBold, size: .bodySmallSemiBold)
        label.textColor = UIColor.infoPressed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let haventAccountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let connectAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Or connect"
        label.font = UIFont.customFont(.light, size: .bodyMediumMedium)
        label.textColor = UIColor.neutral60
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let facebookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_facebook.pdf")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let instagramImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_instagram.pdf")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let twiterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_twiter.pdf")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let socialsAccountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(coordinator: RegisterCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        initView()
        setActions()
    }
    
    private func initView() {
        view.backgroundColor = .white
        view.addSubview(backImageView)
        
        view.addSubview(titleLogin)
        view.addSubview(subtitleLogin)
        view.addSubview(inputAllStackView)
        
        inputAllStackView.addArrangedSubview(usernameTextField)
        inputAllStackView.addArrangedSubview(emailTextField)
        inputAllStackView.addArrangedSubview(passwordTextField)
    
        view.addSubview(quantityPasswordLabel)
        view.addSubview(loginButton)
        view.addSubview(haventAccountStackView)
        view.addSubview(connectAccountLabel)
        view.addSubview(socialsAccountStackView)
        
        haventAccountStackView.addArrangedSubview(haventAccountLabel)
        haventAccountStackView.addArrangedSubview(signUpAccountLabel)
        
        socialsAccountStackView.addArrangedSubview(facebookImageView)
        socialsAccountStackView.addArrangedSubview(instagramImageView)
        socialsAccountStackView.addArrangedSubview(twiterImageView)
        
        NSLayoutConstraint.activate([
            
            backImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backImageView.heightAnchor.constraint(equalToConstant: 40),
            backImageView.widthAnchor.constraint(equalToConstant: 40),
            
            titleLogin.topAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 60),
            titleLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subtitleLogin.topAnchor.constraint(equalTo: titleLogin.bottomAnchor, constant: 20),
            subtitleLogin.centerXAnchor.constraint(equalTo: titleLogin.centerXAnchor),
            
            inputAllStackView.topAnchor.constraint(equalTo: subtitleLogin.bottomAnchor, constant: 40),
            inputAllStackView.centerXAnchor.constraint(equalTo: subtitleLogin.centerXAnchor),
            inputAllStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputAllStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            quantityPasswordLabel.topAnchor.constraint(equalTo: inputAllStackView.bottomAnchor, constant: 16),
            quantityPasswordLabel.leadingAnchor.constraint(equalTo: inputAllStackView.leadingAnchor),
            quantityPasswordLabel.trailingAnchor.constraint(equalTo: inputAllStackView.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: quantityPasswordLabel.bottomAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: quantityPasswordLabel.trailingAnchor),
            loginButton.leadingAnchor.constraint(equalTo: quantityPasswordLabel.leadingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            haventAccountStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 24),
            haventAccountStackView.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            
            connectAccountLabel.bottomAnchor.constraint(equalTo: socialsAccountStackView.topAnchor, constant: -20),
            connectAccountLabel.centerXAnchor.constraint(equalTo: haventAccountStackView.centerXAnchor),
            
            socialsAccountStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            socialsAccountStackView.centerXAnchor.constraint(equalTo: connectAccountLabel.centerXAnchor),
        ])
        
        validateInputs()
    }
    
    private func validateInputs() {
        // Añadir observers a los textfields para detectar cambios en el texto
        usernameTextField.textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        passwordTextField.textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    // Método que se llama cada vez que el usuario escribe en los textfields
    @objc private func textFieldsDidChange() {
        let isUsernameEmpty = usernameTextField.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
        let isEmailEmpty = emailTextField.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
        let isPasswordEmpty = passwordTextField.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
        
        // Habilitar el botón solo si ambos campos tienen texto
        if !isUsernameEmpty && !isPasswordEmpty && !isEmailEmpty{
            loginButton.configure(title: "Sign In", status: .enabled)
        } else {
            loginButton.configure(title: "Sign In", status: .disabled)
        }
    }
    
    func setActions() {
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        backImageView.isUserInteractionEnabled = true
        backImageView.addGestureRecognizer(backGesture)
        
        let signUpGesture = UITapGestureRecognizer(target: self, action: #selector(signUpTapped))
        signUpAccountLabel.isUserInteractionEnabled = true
        signUpAccountLabel.addGestureRecognizer(signUpGesture)
    }
    
    @objc func backTapped() {
        print("Tap -------- Froget password")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func signUpTapped() {
        print("Tap -------- Froget password")
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapLoginButton() {
        
    }

}
