//
//  RegisterCoordinator.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/27/25.
//

import Foundation
import UIKit

protocol RegisterCoordinatorProtocol{
    func showRegisterErrorAlert(title: String?, message: String?, actionTitle: String?)
}

class RegisterCoordinator: RegisterCoordinatorProtocol{
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showRegisterErrorAlert(title: String?, message: String?, actionTitle: String?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let dismiss = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alertController.addAction(dismiss)
        navigationController.present(alertController, animated: true, completion: nil)
    }
}
