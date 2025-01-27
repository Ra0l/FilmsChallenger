//
//  Extension+TextField.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/27/25.
//

import Foundation
import UIKit

extension UITextField {
    
    func setFont(_ font: UIFont, _ color: UIColor) {
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font : font
        ]
        
        self.defaultTextAttributes = textAttributes
    }
    
    func setPlaceholderFont(_ placeholder: String? = "", _ font: UIFont, _ color: UIColor) {
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font : font
        ]

        self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: placeholderAttributes)
    }
}
