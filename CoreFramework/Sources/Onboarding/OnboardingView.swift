//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by Gabriel Simões on 29/05/25.
//
import Foundation
import UIKit

public class OnboardingView: UIView {
    private var steps: [(image: UIImage?, text: String)] = []
    private var currentStep = 0
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = Colors.gray_100.withAlphaComponent(0.6)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.gray_700
        label.font = Text.heading
        label.numberOfLines = 0
        label.textAlignment = .center
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Proximo", for: .normal)
        button.titleLabel?.font = Text.subheading
        button.setTitleColor(Colors.red_base, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public init() {
        super.init(frame: .zero)
        nextButton.addTarget(self, action: #selector(didTapNextStep), for: .touchUpInside)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backgroundView)
        addSubview(imageView)
        addSubview(messageLabel)
        addSubview(nextButton)
        
        setupContraints()
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Metrics.small),
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
            nextButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Metrics.medium),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
    
    public func presentOnboarding(on view: UIView, with steps: [(image: UIImage?, text: String)]) {
        self.steps = steps
        self.currentStep = 0
        //criar uma func para interar o step
        
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        updateStep(animated: true)
    }
    
    @objc
    private func didTapNextStep() {
        currentStep += 1
        
        if currentStep < steps.count {
            updateStep()
        } else {
            dismiss()
        }
    }
    
    private func updateStep(animated: Bool = false) {
        let step = steps[currentStep]
        imageView.image = step.image
        messageLabel.text = step.text
        
        if animated {
            animateTextEntry()
        } else {
            messageLabel.alpha = 1
            messageLabel.transform = .identity
        }
    }
    
    private func animateTextEntry() {
        messageLabel.alpha = 0
        messageLabel.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.messageLabel.alpha = 1
            self.messageLabel.transform = .identity
        })
        
        
    }
    private func dismiss() {
        removeFromSuperview()
    }
}
