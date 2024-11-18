//
//  AppDelegate.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit

class AMLabel: UILabel, AMShape, AMBorder, AMShadow {
    
    @IBInspectable var shape_cornerRadius: CGFloat = 0 {
        didSet { self.updateShapeAppereance() }
    }
    
    @IBInspectable var border_width: CGFloat = 0 {
        didSet { self.updateBorderAppereance() }
    }
    
    @IBInspectable var border_color: UIColor = .black {
        didSet { self.updateBorderAppereance() }
    }
    
    @IBInspectable var shadow_opacity: Float = 0.5 {
        didSet { self.updateShadowAppereance() }
    }
    
    @IBInspectable var shadow_radius: CGFloat = 5 {
        didSet { self.updateShadowAppereance() }
    }
    
    @IBInspectable var shadow_offset: CGSize = .zero {
        didSet { self.updateShadowAppereance() }
    }
    
    @IBInspectable var shadow_color: UIColor = .clear {
        didSet { self.updateShadowAppereance() }
    }
}

