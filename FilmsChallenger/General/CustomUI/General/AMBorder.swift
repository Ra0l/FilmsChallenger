//
//  AppDelegate.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit

protocol AMBorder {
    var border_color: UIColor { get set }
    var border_width: CGFloat { get set }
}

extension AMBorder where Self: UIView {
    
    func updateBorderAppereance() {
        self.layer.borderWidth = self.border_width
        self.layer.borderColor = self.border_color.cgColor
    }
}
