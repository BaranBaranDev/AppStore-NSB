//
//  CustomImageView.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 16.04.2024.
//

import UIKit

final class CustomImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.backgroundColor = Colors.secondarySystemFill
        self.layer.cornerRadius = 8
        self.layer.borderColor = Colors.lightGray.cgColor
        self.layer.borderWidth = 0.5
    }
}


