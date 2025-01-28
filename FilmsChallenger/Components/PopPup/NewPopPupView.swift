//
//  NewPopPupView.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/28/25.
//

import Foundation
import UIKit


class NewPopupView: UIView {

    private let contentView = UIView()
    private let backgroundView = UIView()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let nextButton = PrimaryButton()
    private let closeButton = UIButton(type: .system)

    //weak var delegate: NewActionButtonProtocol?

    var data: Any? = nil
    private var id: String = ""
    private weak var owner: UIViewController? {
        didSet {
            guard let owner = self.owner else { return }
            owner.view.addSubview(self)
            setupConstraints()
            owner.view.layoutIfNeeded()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(owner: UIViewController, title: String, message: String, buttonTitle: String = "Entendido", data: Any? = nil, id: String = "") {
        self.init(frame: .zero)
        self.displayView(owner: owner, title: title, message: message, buttonTitle: buttonTitle, data: data, id: id)
    }

    private func config() {
        // Configuración de la vista principal
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        // Configuración de contentView
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 24
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)

        // Configuración de backgroundView
        backgroundView.backgroundColor = .clear
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backgroundView)

        // Configuración de titleLabel
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        // Configuración de messageLabel
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.textColor = .darkGray
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messageLabel)

        // Configuración de nextButton
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .blue
        nextButton.layer.cornerRadius = 12
        nextButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nextButton)

        // Configuración de closeButton
        closeButton.setTitle("✖️", for: .normal)
        closeButton.tintColor = .gray
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(closeButton)
    }

    private func setupConstraints() {
        guard let owner = owner else { return }
        
        // Constraints de la vista principal
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: owner.view.topAnchor),
            self.bottomAnchor.constraint(equalTo: owner.view.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: owner.view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: owner.view.trailingAnchor)
        ])

        // Constraints de contentView
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contentView.widthAnchor.constraint(equalToConstant: 300),
            contentView.heightAnchor.constraint(equalToConstant: 200)
        ])

        // Constraints de closeButton
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])

        // Constraints de titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])

        // Constraints de messageLabel
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])

        // Constraints de nextButton
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 150),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    func displayView(owner: UIViewController, title: String, message: String, buttonTitle: String = "Entendido", data: Any? = nil, id: String = "") {
        self.owner = owner

        titleLabel.text = title
        messageLabel.text = message

        nextButton.setTitle(buttonTitle, for: .normal)

        self.data = data
        self.id = id
    }

    @objc func buttonTapped(_ sender: Any) {
        removeFromSuperview()
    }

    @objc func closeButtonTapped(_ sender: UIButton) {
        removeFromSuperview()
    }
}
