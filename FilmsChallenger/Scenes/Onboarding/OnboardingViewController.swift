//
//  OnboardingViewController.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 10/3/24.
//

import UIKit

class OnboardingViewController: UIViewController, OnboardingComponentDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.setupUI()
    }
    
    func setupUI() {
        // Inicializar el componente de Onboarding
        let onboardingComponent = OnboardingComponent()
        onboardingComponent.delegate = self
        onboardingComponent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboardingComponent)
        
        // Añadir restricciones
        NSLayoutConstraint.activate([
            onboardingComponent.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            onboardingComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Configurar el contenido del onboarding
        let onboardingData: [OnboardingPageData] = [
            OnboardingPageData(imageName: "onboarding1",
                               titleText: "Fastest Payment in the world",
                               descriptionText: "Integrate multiple payment methoods to help you up the process quickly"),
            OnboardingPageData(imageName: "onboarding2",
                               titleText: "The most Secure Platform for Customer",
                               descriptionText: "Built-in Fingerprint, face recognition and more, keeping you completely safe"),
            OnboardingPageData(imageName: "onboarding3",
                               titleText: "Paying for Everything is Easy and Convenient",
                               descriptionText: "Built-in Fingerprint, face recognition and more, keeping you completely safe")
        ]
        
        // Asignar los datos al componente
        onboardingComponent.onboardingData = onboardingData
    }
    
    func didFinishOnboarding() {
        let loginVc = LoginViewController()
        loginVc.modalPresentationStyle = .fullScreen
        present(loginVc, animated: true)
    }
}
