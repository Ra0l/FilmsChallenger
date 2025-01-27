//
//  UIColor+Extension.swift
//  Tidoy
//
//  Created by Raul Kevin Aliaga Shapiama on 11/6/24.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension UIColor {
    
    // MARK: - Primary Colors
    static var primaryMain: UIColor { UIColor(hex: "#FF5733") }
    static var primarySurface: UIColor { UIColor(hex: "#FFE1D5") }
    static var primaryBorder: UIColor { UIColor(hex: "#FF8A70") }
    static var primaryHover: UIColor { UIColor(hex: "#FF6B48") }
    static var primaryPressed: UIColor { UIColor(hex: "#FF4B23") }
    static var primaryFocus: UIColor { UIColor(hex: "#FFD1C3") }
    
    // MARK: - Info Colors
    static var infoMain: UIColor { UIColor(hex: "#3498DB") }
    static var infoSurface: UIColor { UIColor(hex: "#D9ECF8") }
    static var infoBorder: UIColor { UIColor(hex: "#5DADE2") }
    static var infoHover: UIColor { UIColor(hex: "#5DADE2") }
    static var infoPressed: UIColor { UIColor(hex: "#2980B9") }
    static var infoFocus: UIColor { UIColor(hex: "#A9DDF2") }
    
    // MARK: - Success Colors
    static var successMain: UIColor { UIColor(hex: "#28B463") }
    static var successSurface: UIColor { UIColor(hex: "#D4EFDF") }
    static var successBorder: UIColor { UIColor(hex: "#52BE80") }
    static var successHover: UIColor { UIColor(hex: "#52BE80") }
    static var successPressed: UIColor { UIColor(hex: "#1D8348") }
    static var successFocus: UIColor { UIColor(hex: "#AED9C9") }
    
    // MARK: - Danger Colors
    static var dangerMain: UIColor { UIColor(hex: "#E74C3C") }
    static var dangerSurface: UIColor { UIColor(hex: "#FADBD8") }
    static var dangerBorder: UIColor { UIColor(hex: "#F5B7B1") }
    static var dangerHover: UIColor { UIColor(hex: "#EC7063") }
    static var dangerPressed: UIColor { UIColor(hex: "#C0392B") }
    static var dangerFocus: UIColor { UIColor(hex: "#F8CFC8") }
    
    // MARK: - Neutral Colors (Grayscale)
    static var neutral10: UIColor { UIColor(hex: "#F4F6F7") }
    static var neutral20: UIColor { UIColor(hex: "#E5E8E8") }
    static var neutral30: UIColor { UIColor(hex: "#CCD1D1") }
    static var neutral40: UIColor { UIColor(hex: "#B3B6B7") }
    static var neutral50: UIColor { UIColor(hex: "#979A9A") }
    static var neutral60: UIColor { UIColor(hex: "#7B7D7D") }
    static var neutral70: UIColor { UIColor(hex: "#616A6B") }
    static var neutral80: UIColor { UIColor(hex: "#424949") }
    static var neutral90: UIColor { UIColor(hex: "#2C3E50") }
    static var neutral100: UIColor { UIColor(hex: "#1B2631") }
}
