//
//  AppDelegate.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit

protocol AMShape {
    var shape_cornerRadius: CGFloat { get set }
}

extension AMShape where Self: UIView {
    
    func updateShapeAppereance() {
        self.layer.cornerRadius = self.shape_cornerRadius
    }
}
