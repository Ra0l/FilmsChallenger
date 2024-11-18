//
//  AppDelegate.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit

class PasswordTextField: GenericTextField {
    
    var showPassword: Bool = false
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.isSecureTextEntry = true
        self.icon_image = UIImage(systemName: "eye")
        self.icon_color = .black
        self.icon_isActive = true
    }
    
    override func updateAppereance() {
        super.updateAppereance()
    }
    
    override func clickBtnIcon(_ sender: UIButton) {
        super.clickBtnIcon(sender)
        
        self.showPassword = !self.showPassword
        self.isSecureTextEntry = !self.showPassword
        self.icon_image = self.showPassword ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye")
    }
}
