//
//  Onboarding.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 10/3/24.
//

import UIKit

// Protocolo que notifica el fin del onboarding
protocol OnboardingComponentDelegate: AnyObject {
    func didFinishOnboarding()
}

// Estructura que define el contenido de cada página del onboarding
struct OnboardingPageData {
    let imageName: String
    let titleText: String?
    let descriptionText: String?
}

import UIKit

// Este es el componente de Onboarding reutilizable
class OnboardingComponent: UIView {
    
    private var pageViewController: UIPageViewController!
    private var pages: [UIViewController] = []
    private var pageControl = UIPageControl()
    
    // Datos del contenido que configurarán las páginas del onboarding
    var onboardingData: [OnboardingPageData] = [] {
        didSet {
            configurePages()
        }
    }
    
    // Delegado para notificar el final del onboarding
    weak var delegate: OnboardingComponentDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponent()
    }
    
    private func setupComponent() {
        // Configurar PageViewController
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        // Añadir el PageViewController como hijo
        addSubview(pageViewController.view)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: self.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        // Configurar PageControl
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    // Configurar las páginas del onboarding usando los datos
    private func configurePages() {
        pages.removeAll()
        
        // Crear una página para cada elemento en onboardingData
        for (index, data) in onboardingData.enumerated() {
            let page = createOnboardingPage(imageName: data.imageName, titleText: data.titleText ?? "", descriptionText: data.descriptionText ?? "", isLastPage: index == onboardingData.count - 1)
            pages.append(page)
        }
        
        // Actualizar el número de páginas del PageControl
        pageControl.numberOfPages = pages.count
        
        // Iniciar con la primera página
        if let firstVC = pages.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // Crear una página del onboarding con el botón
    private func createOnboardingPage(imageName: String, titleText: String, descriptionText: String, isLastPage: Bool) -> UIViewController {
        let page = UIViewController()
        
        // Configurar la vista
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = descriptionText
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 2
        
        let stackView = UIStackView(arrangedSubviews: [imageView,
                                                       titleLabel,
                                                       descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // Crear el botón "Next"
        let nextButton = UIButton(type: .system)
        nextButton.setTitle(isLastPage ? "Finish" : "Next", for: .normal)
        nextButton.backgroundColor = .systemBlue
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 10
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Acción del botón
        nextButton.addTarget(self, action: isLastPage ? #selector(finishOnboarding) : #selector(nextButtonTapped), for: .touchUpInside)
        
        // Añadir el botón a la vista
        page.view.addSubview(stackView)
        page.view.addSubview(nextButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: page.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: page.view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: page.view.leadingAnchor, constant: 46),
            stackView.trailingAnchor.constraint(equalTo: page.view.trailingAnchor, constant: -46),
            
            //nextButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            nextButton.leadingAnchor.constraint(equalTo: page.view.leadingAnchor, constant: 40),
            nextButton.trailingAnchor.constraint(equalTo: page.view.trailingAnchor, constant: -40),
            nextButton.bottomAnchor.constraint(equalTo: page.bottomLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        return page
    }
    
    @objc private func nextButtonTapped() {
        // Navegar a la siguiente página o finalizar si es la última
        if let currentVC = pageViewController.viewControllers?.first,
           let currentIndex = pages.firstIndex(of: currentVC) {
            let nextIndex = currentIndex + 1
            
            if nextIndex < pages.count {
                pageViewController.setViewControllers([pages[nextIndex]], direction: .forward, animated: true, completion: nil)
                pageControl.currentPage = nextIndex
            }
        }
    }
    
    @objc private func finishOnboarding() {
        // Notificar al delegado que el onboarding ha terminado
        delegate?.didFinishOnboarding()
    }
}

// MARK: - PageViewController DataSource and Delegate
extension OnboardingComponent: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = currentIndex - 1
        return previousIndex >= 0 ? pages[previousIndex] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = currentIndex + 1
        return nextIndex < pages.count ? pages[nextIndex] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let visibleViewController = pageViewController.viewControllers?.first,
           let index = pages.firstIndex(of: visibleViewController) {
            pageControl.currentPage = index
        }
    }
}
