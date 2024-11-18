//
//  AppDelegate.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit

class GenericTextField: AMTextField {
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        self.updateAppereance()
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect)
        self.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    func updateAppereance() {
        self.textColor = .darkGray
    }
}
