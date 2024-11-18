//
//  ContentView.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/19/24.
//

import UIKit
@IBDesignable class ContentView: AMView {
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        self.updateAppereance()
    }
        
    private func updateAppereance() {
        
        self.shape_cornerRadius = 10
        self.border_width = 1
        self.border_color = .darkGray
        self.shadow_opacity = 3.0
        self.backgroundColor = .white
    }
}
