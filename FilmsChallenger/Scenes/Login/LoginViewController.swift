//
//  LoginViewController.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit
import Firebase
import Combine
import NVActivityIndicatorView

class LoginViewController: UIViewController {
    
    var coordinator: LoginCoordinatorProtocol?
    private var cancellables = Set<AnyCancellable>()
    // Agregar el loader
    private let activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 60),
                                                            type: .circleStrokeSpin,
                                                            color: UIColor.infoPressed,
                                                            padding: 0)
    
    private let titleLogin: UILabel = {
        let label = UILabel()
        label.text = "Sign in now"
        label.font = UIFont.customFont(.semiBold, size: .heading3)
        label.textColor = UIColor.neutral100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLogin: UILabel = {
        let label = UILabel()
        label.text = "Please sign in to continue our app"
        label.font = UIFont.customFont(.light, size: .heading5)
        label.textColor = UIColor.neutral60
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameTextField: LoginInputTextField = {
        let textField = LoginInputTextField()
        textField.configure(withPlaceholder: "Username o Email", type: .email)
        textField.textField.text = "Admin"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: LoginInputTextField = {
        let textField = LoginInputTextField()
        textField.configure(withPlaceholder: "Password", type: .password)
        textField.textField.text = "Password*123"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let forgetLabel: UILabel = {
        let label = UILabel()
        label.text = "Forget password?"
        label.font = UIFont.customFont(.semiBold, size: .bodySmallSemiBold)
        label.textColor = UIColor.infoPressed
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginButton: PrimaryButton = {
        let button = PrimaryButton()
        button.configure(title: "Sign In", status: .disabled)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let haventAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.font = UIFont.customFont(.light, size: .bodyMediumMedium)
        label.textColor = UIColor.neutral60
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signUpAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up"
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
    
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setActions()
        bindingView()
    }
    
    private func initView() {
        view.backgroundColor = .white
        view.addSubview(titleLogin)
        view.addSubview(subtitleLogin)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgetLabel)
        view.addSubview(loginButton)
        view.addSubview(haventAccountStackView)
        view.addSubview(connectAccountLabel)
        view.addSubview(socialsAccountStackView)
        
        haventAccountStackView.addArrangedSubview(haventAccountLabel)
        haventAccountStackView.addArrangedSubview(signUpAccountLabel)
        
        socialsAccountStackView.addArrangedSubview(facebookImageView)
        socialsAccountStackView.addArrangedSubview(instagramImageView)
        socialsAccountStackView.addArrangedSubview(twiterImageView)
        
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            
            titleLogin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subtitleLogin.topAnchor.constraint(equalTo: titleLogin.bottomAnchor, constant: 20),
            subtitleLogin.centerXAnchor.constraint(equalTo: titleLogin.centerXAnchor),
            
            usernameTextField.topAnchor.constraint(equalTo: subtitleLogin.bottomAnchor, constant: 40),
            usernameTextField.centerXAnchor.constraint(equalTo: subtitleLogin.centerXAnchor),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 24),
            passwordTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            
            forgetLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            forgetLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            forgetLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: forgetLabel.bottomAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: forgetLabel.trailingAnchor),
            loginButton.leadingAnchor.constraint(equalTo: forgetLabel.leadingAnchor),
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
    
    private func bindingView() {
        viewModel.loadingPublisher
            .sink { [weak self] isLoading in
                isLoading ? self?.startLoading() : self?.stopLoading()
            }
            .store(in: &cancellables)
        
        viewModel.successPublisher
            .sink { [weak self] in
                self?.coordinator?.goToHome()
            }
            .store(in: &cancellables)
        
        viewModel.errorPublisher
            .sink { [weak self] errorMessage in
                self?.coordinator?.showLoginErrorAlert()
            }
            .store(in: &cancellables)
    }
    
    private func validateInputs() {
        // Añadir observers a los textfields para detectar cambios en el texto
        usernameTextField.textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        passwordTextField.textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    // Método que se llama cada vez que el usuario escribe en los textfields
    @objc private func textFieldsDidChange() {
        let isUsernameEmpty = usernameTextField.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
        let isPasswordEmpty = passwordTextField.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
        
        // Habilitar el botón solo si ambos campos tienen texto
        if !isUsernameEmpty && !isPasswordEmpty {
            loginButton.configure(title: "Sign In", status: .enabled)
        } else {
            loginButton.configure(title: "Sign In", status: .disabled)
        }
    }
    
    func setActions() {
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        let forgetGesture = UITapGestureRecognizer(target: self, action: #selector(forgetTapped))
        forgetLabel.isUserInteractionEnabled = true
        forgetLabel.addGestureRecognizer(forgetGesture)
        
        let signUpGesture = UITapGestureRecognizer(target: self, action: #selector(signUpTapped))
        signUpAccountLabel.isUserInteractionEnabled = true
        signUpAccountLabel.addGestureRecognizer(signUpGesture)
    }
    
    @objc func forgetTapped() {
        print("Tap -------- Froget password")
    }
    
    @objc func signUpTapped() {
        coordinator?.goToRegisterAccount()
    }
    
    @objc private func didTapLoginButton() {
        guard let email = usernameTextField.textField.text, let password = passwordTextField.textField.text else { return }
        viewModel.loginWithUser(email, password: password)
    }
    
    // Métodos para manejar el loader
    private func startLoading() {
        activityIndicator.startAnimating()
    }
    
    private func stopLoading() {
        activityIndicator.stopAnimating()
    }
}
