//
//  RegisterCoordinator.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/27/25.
//

import Foundation
import UIKit

protocol RegisterCoordinatorProtocol{

}

class RegisterCoordinator: RegisterCoordinatorProtocol{
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
