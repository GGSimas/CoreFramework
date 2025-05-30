//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by Gabriel Simões on 29/05/25.
//
import Foundation
import UIKit

public class OnboardingView: UIView {
    private var steps: [String] = []
    private var currentStep = 0
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = Colors.gray_100.withAlphaComponent(0.4)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.gray_300
        label.font = Text.heading
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Proximo", for: .normal)
        button.titleLabel?.font = Text.subheading
        button.setTitleColor(Colors.red_base, for: .normal)
        button.addTarget(self, action: #selector(didTapNextStep), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backgroundView)
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
            
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
            nextButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Metrics.medium),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
    
    public func presentOnboarding(on view: UIView, with steps: [String]) {
        self.steps = steps
        self.currentStep = 0
        //criar uma func para interar o step
        
        view.addSubview(self)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
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
    
    private func updateStep() {
        messageLabel.text = steps[currentStep]
    }
    
    private func dismiss() {
        removeFromSuperview()
    }
}
