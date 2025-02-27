//
//  AppDelegate.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit

class AMTextField: UITextField, AMShape, AMBorder, AMShadow {
    
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
    
    @IBInspectable var icon_image: UIImage? {
        didSet { self.updateIcon() }
    }
    
    @IBInspectable var icon_color: UIColor = .clear {
        didSet { self.updateIcon() }
    }
    
    @IBInspectable var icon_isActive: Bool = false {
        didSet { self.updateIcon() }
    }
    
    private func updateIcon() {
        
        let iconView = self.createButtonWithImage(self.icon_image, imageColor: self.icon_color, isActive: self.icon_isActive)
        self.rightView = iconView
        self.rightViewMode = .always
    }
    
    private func createButtonWithImage(_ image: UIImage?, imageColor: UIColor, isActive: Bool) -> UIView? {
        
        guard let image = image else { return nil }
        
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: self.frame.height))
        
        let btn = UIButton(type: .system)
        btn.setImage(image, for: .normal)
        btn.frame = contentView.bounds
        btn.isUserInteractionEnabled = isActive
        btn.tintColor = imageColor
        btn.addTarget(self, action: #selector(self.clickBtnIcon(_:)), for: .touchUpInside)
        
        contentView.addSubview(btn)
        return contentView
    }
    
    @objc func clickBtnIcon(_ sender: UIButton) {
        
        print("Tocaron el icono")
    }
}
