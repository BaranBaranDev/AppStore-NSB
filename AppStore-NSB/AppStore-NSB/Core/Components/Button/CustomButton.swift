//
//  CustomButton.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 20.04.2024.
//

import UIKit


final class CustomButton: UIButton {
    private var buttonTitle: String?
    
    // MARK: - İnitialization
    init(title: String? = nil) {
        self.buttonTitle = title
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    private func configure() {
        setTitle(buttonTitle ?? "Button", for: .normal)
        setTitleColor(.systemBlue, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        backgroundColor = UIColor.tertiaryLabel.withAlphaComponent(0.2)
        layer.cornerRadius = 8
    }
}
