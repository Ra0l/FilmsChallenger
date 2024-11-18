//
//  AppDelegate.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit

class EmailTextField: GenericTextField {
    
    override func updateAppereance() {
        super.updateAppereance()
        self.keyboardType = .emailAddress
    }
}
