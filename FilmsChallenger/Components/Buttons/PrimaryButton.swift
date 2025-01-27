//
//  PrimaryButton.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 1/27/25.
//

import Foundation
import UIKit

class PrimaryButton: UIButton {
    
    var status: PrimaryFilledButtonStatus = .disabled {
        didSet {
            changeStatus(status: status)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 8
        backgroundColor = UIColor.infoMain
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.customFont(.semiBold, size: .bodyMediumSemiBold)
    }
    
    func configure(title: String, status: PrimaryFilledButtonStatus) {
        setTitle(title, for: .normal)
        self.status = status
    }
    
    func changeStatus(status: PrimaryFilledButtonStatus) {
        switch status {
        //case .loading:
        case .enabled:
            backgroundColor = UIColor.infoPressed
            isUserInteractionEnabled = true
        case .disabled:
            backgroundColor = UIColor.infoFocus
            isUserInteractionEnabled = false
        }
    }
}

enum PrimaryFilledButtonStatus {
    //case loading
    case enabled
    case disabled
}
