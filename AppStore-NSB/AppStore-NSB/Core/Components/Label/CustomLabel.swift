//
//  CustomLabel.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 20.04.2024.
//

import UIKit

final class CustomLabel: UILabel {
    
    // MARK: - Properties
    var customText: String?{
        didSet{
            self.text = customText
            }
        }
   
    var customFontSize: CGFloat?{
        didSet{
            self.font = UIFont.systemFont(ofSize: customFontSize ?? 15)
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    private func configure(){
        adjustsFontForContentSizeCategory = true
        numberOfLines = 0
        textAlignment = .left
        textColor = .black
        font = UIFont.systemFont(ofSize: 15)
       
    }
    
}
