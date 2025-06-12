//
//  ToggleCheckbox.swift
//  CoreApp
//
//  Created by Gabriel Simões on 11/06/25.
//

import Foundation
import UIKit

public class ToggleCheckbox: UIButton {
    private var isChecked: Bool = false
    
    private let checkImage = UIImage(named: "checked")
    private let uncheckImage = UIImage(named: "unchecked")
    
    public init() {
        super.init(frame: .zero)
        self.setImage(uncheckImage, for: .normal)
        self.addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func toggle() {
        isChecked.toggle()
        self.setImage(isChecked ? checkImage : uncheckImage, for: .normal)
    }
    
    public func getIsCheckedState() -> Bool {
        return isChecked
    }
}
