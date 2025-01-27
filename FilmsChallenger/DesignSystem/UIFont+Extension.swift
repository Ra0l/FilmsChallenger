//
//  UIFont+Extension.swift
//  Tidoy
//
//  Created by Raul Kevin Aliaga Shapiama on 11/6/24.
//

import UIKit

import UIKit

extension UIFont {
    
    enum ManropeFontWeight: String {
        case regular = "Manrope-Regular"
        case medium = "Manrope-Medium"
        case bold = "Manrope-Bold"
        case semiBold = "Manrope-SemiBold"
        case extraBold = "Manrope-ExtraBold"
        case light = "Manrope-Light"
        case extraLight = "Manrope-ExtraLight"
    }
    
    enum SizeFont {
        // Headings
        case heading1
        case heading2
        case heading3
        case heading4
        case heading5
        case heading6
        
        // Body Large
        case bodyLargeSemiBold
        case bodyLargeMedium
        case bodyLargeRegular
        
        // Body Medium
        case bodyMediumSemiBold
        case bodyMediumMedium
        case bodyMediumRegular
        
        // Body Small
        case bodySmallSemiBold
        case bodySmallMedium
        case bodySmallRegular
        
        // Body XSmall
        case bodyXSmallSemiBold
        case bodyXSmallMedium
        case bodyXSmallRegular
        
        // Body 2XSmall
        case body2XSmallSemiBold
        case body2XSmallMedium
        case body2XSmallRegular
        
        // Método para obtener el tamaño en `CGFloat`
        var value: CGFloat {
            switch self {
                // Headings
            case .heading1: return 48
            case .heading2: return 40
            case .heading3: return 32
            case .heading4: return 24
            case .heading5: return 20
            case .heading6: return 18
                
                // Body Large
            case .bodyLargeSemiBold, .bodyLargeMedium, .bodyLargeRegular: return 18
                
                // Body Medium
            case .bodyMediumSemiBold, .bodyMediumMedium, .bodyMediumRegular: return 16
                
                // Body Small
            case .bodySmallSemiBold, .bodySmallMedium, .bodySmallRegular: return 14
                
                // Body XSmall
            case .bodyXSmallSemiBold, .bodyXSmallMedium, .bodyXSmallRegular: return 12
                
                // Body 2XSmall
            case .body2XSmallSemiBold, .body2XSmallMedium, .body2XSmallRegular: return 10
            }
        }
    }
    
    static func customFont(_ weight: ManropeFontWeight, size: SizeFont) -> UIFont {
        return UIFont(name: weight.rawValue, size: size.value) ?? UIFont.systemFont(ofSize: size.value)
    }
}
