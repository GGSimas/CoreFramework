//
//  ButtonViewController.swift
//  CoreApp
//
//  Created by Gabriel Simões on 11/06/25.
//

import Foundation
import UIKit

class ButtonViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        guard let starIcon = UIImage(systemName: "star") else { return }
        let buttonWithIcon  = Button(title: "Botão com icone", icon: starIcon, iconPosition: .horizontal)
        let buttonWithoutIcon  = Button(title: "Botão sem icone")
        
        buttonWithIcon.translatesAutoresizingMaskIntoConstraints = false
        buttonWithoutIcon.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonWithIcon)
        view.addSubview(buttonWithoutIcon)
        
        NSLayoutConstraint.activate([
            buttonWithIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonWithIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonWithIcon.heightAnchor.constraint(equalToConstant: 50),
            buttonWithIcon.widthAnchor.constraint(equalToConstant: 300),
            
            buttonWithoutIcon.topAnchor.constraint(equalTo: buttonWithIcon.bottomAnchor, constant: 16),
            buttonWithoutIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonWithoutIcon.heightAnchor.constraint(equalToConstant: 50),
            buttonWithoutIcon.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

extension ButtonViewController: ButtonDelegate {
    func buttonAction() {
        // any code
    }
}
