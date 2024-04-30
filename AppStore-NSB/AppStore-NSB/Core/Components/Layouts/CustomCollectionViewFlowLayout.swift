//
//  CustomCollectionViewFlowLayout.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 21.04.2024.
//

import UIKit

final class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    // MARK: - Properties
    private var customItemSize: CGSize = CGSize(width: 250, height: 200)
 //   private var customMinimumLineSpacing: CGFloat = 10
   // private var customMinimumInteritemSpacing: CGFloat = 10
    
// MARK: - İnitialization
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
// MARK: - Helpers
    private func setupLayout() {
        scrollDirection = .horizontal
        itemSize = customItemSize
      //  minimumLineSpacing = customMinimumLineSpacing
       // minimumInteritemSpacing = customMinimumInteritemSpacing
    }
}


