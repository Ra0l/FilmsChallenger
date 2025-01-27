//
//  LoginInputTextField.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/26/25.
//

import Foundation
import UIKit

class LoginInputTextField: UIView {
    
    private let viewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let viewError: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let lblError: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = ""
        label.textColor = UIColor.dangerMain
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackViewInput: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let imageLeft: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "mail")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageRight: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "eye")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let viewImageRight: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackViewTextField: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 18
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        
        viewContainer.layer.cornerRadius = 8
        //viewContainer.layer.borderWidth = 1
        viewContainer.layer.borderColor = UIColor.neutral100.cgColor
        viewContainer.backgroundColor = UIColor.neutral10
        
        addSubview(stackViewInput)
        stackViewInput.addArrangedSubview(viewContainer)
        stackViewInput.addArrangedSubview(viewError)
        stackViewInput.addSubview(imageLeft)
        stackViewInput.addSubview(stackViewTextField)
        
        viewError.addSubview(lblError)
        
        stackViewTextField.addArrangedSubview(textField)
        stackViewTextField.addArrangedSubview(viewImageRight)
        
        viewImageRight.addSubview(imageRight)
        
        NSLayoutConstraint.activate([
            stackViewInput.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackViewInput.topAnchor.constraint(equalTo: topAnchor),
            stackViewInput.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewInput.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewInput.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            textField.heightAnchor.constraint(equalToConstant: 56),
            
            imageLeft.heightAnchor.constraint(equalToConstant: 26),
            imageLeft.widthAnchor.constraint(equalToConstant: 26),
            imageLeft.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 18),
            imageLeft.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor),
            
            imageRight.heightAnchor.constraint(equalToConstant: 26),
            imageRight.widthAnchor.constraint(equalToConstant: 26),
            imageRight.leadingAnchor.constraint(equalTo: viewImageRight.leadingAnchor),
            imageRight.trailingAnchor.constraint(equalTo: viewImageRight.trailingAnchor),
            imageRight.centerYAnchor.constraint(equalTo: viewImageRight.centerYAnchor),
            imageRight.centerXAnchor.constraint(equalTo: viewImageRight.centerXAnchor),
            
            stackViewTextField.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            stackViewTextField.leadingAnchor.constraint(equalTo: imageLeft.trailingAnchor, constant: 18),
            stackViewTextField.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -18),
            stackViewTextField.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor),
            
            lblError.topAnchor.constraint(equalTo: viewError.topAnchor),
            lblError.leadingAnchor.constraint(greaterThanOrEqualTo: viewError.leadingAnchor),
            lblError.trailingAnchor.constraint(equalTo: viewError.trailingAnchor),
            lblError.bottomAnchor.constraint(equalTo: viewError.bottomAnchor),
        ])
        
        viewError.isHidden = true
        addActions()
    }
    
    func addActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(passwordGesture))
        imageRight.isUserInteractionEnabled = true
        imageRight.addGestureRecognizer(tap)
    }
    
    func configure(withPlaceholder placeholder: String? = "", errorMessage: String? = nil, status: Bool = false, type: LoginInputTextFieldType) {
        
        textField.placeholder = placeholder
        
        switch type {
        case .email:
            viewImageRight.isHidden = true
        case .password:
            imageLeft.image = UIImage(systemName: "lock.circle")
            viewImageRight.isHidden = false
            passwordGesture()
        case .personality:
            imageLeft.image = UIImage(systemName: "person.circle")
            viewImageRight.isHidden = true
        }
        
        textField.font = UIFont.customFont(.medium, size: .bodyMediumMedium)
        textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [
            .foregroundColor: UIColor.neutral50,
            .font: UIFont.customFont(.medium, size: .bodyMediumMedium)
        ])
    }
        
    @objc func passwordGesture() {
        textField.isSecureTextEntry = !textField.isSecureTextEntry
        imageRight.image = textField.isSecureTextEntry ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash")
    }
}

enum LoginInputTextFieldType {
    case email
    case password
    case personality
}

