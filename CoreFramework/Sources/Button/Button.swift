//
//  Button.swift
//  CoreApp
//
//  Created by Gabriel Simões on 11/06/25.
//

import Foundation
import UIKit
import CoreFramework

protocol ButtonDelegate: AnyObject {
    func buttonAction()
}

class Button: UIButton {
    weak var delegate: ButtonDelegate?
    private var iconPosition: NSLayoutConstraint.Axis?
    private var customWidth: CGFloat?
    
    init(title: String, backgroundColor: UIColor = Colors.red_base) {
        super.init(frame: .zero)
        setupButton(title: title, icon: nil, iconPosition: nil, width: nil, backgroundColor: backgroundColor)
    }
    
    init(title: String, icon: UIImage, iconPosition: NSLayoutConstraint.Axis, backgroundColor: UIColor = Colors.red_base) {
        super.init(frame: .zero)
        setupButton(title: title, icon: icon, iconPosition: iconPosition, width: nil, backgroundColor: backgroundColor)
    }
    
    init(title: String, width: CGFloat, backgroundColor: UIColor = Colors.red_base) {
        super.init(frame: .zero)
        setupButton(title: title, icon: nil, iconPosition: nil, width: width, backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(
        title: String,
        icon: UIImage?,
        iconPosition: NSLayoutConstraint.Axis?,
        width: CGFloat?,
        backgroundColor: UIColor,
    ) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = Text.subheading
        self.setTitleColor(Colors.gray_800, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = Metrics.medium
        self.isEnabled = true
        
        if let icon = icon, let iconPosition = iconPosition {
            self.setImage(icon, for: .normal)
            self.tintColor = Colors.gray_800
            self.iconPosition = iconPosition
            adjustIconPosition()
        }
        
        self.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func adjustIconPosition() {
        guard let iconPosition = iconPosition else {
            return
        }
        
        if iconPosition == .horizontal {
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        } else {
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -8, right: 0)
        }
    }
    
    @objc
    private func didTapButton() {
        self.delegate?.buttonAction()
    }
    
}
