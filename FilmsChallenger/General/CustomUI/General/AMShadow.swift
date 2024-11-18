//
//  AppDelegate.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit

protocol AMShadow {
    
    var shadow_opacity: Float { get set }
    var shadow_radius: CGFloat { get set }
    var shadow_offset: CGSize { get set }
    var shadow_color: UIColor { get set }
}

extension AMShadow where Self: UIView {
    
    func updateShadowAppereance() {
        self.layer.shadowOpacity = self.shadow_opacity
        self.layer.shadowRadius = self.shadow_radius
        self.layer.shadowOffset = self.shadow_offset
        self.layer.shadowColor = self.shadow_color.cgColor
    }
}
