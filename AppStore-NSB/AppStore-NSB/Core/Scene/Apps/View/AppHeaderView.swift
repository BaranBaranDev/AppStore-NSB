//
//  AppHeaderView.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 21.04.2024.
//

import UIKit

// UICollectionReusableView sınıfı, bir koleksiyon görünümünde yeniden kullanılabilir bir görünümü temsil eder
final class AppHeaderView: UICollectionReusableView {
    
    
    // MARK: - Properties
    static let reuseID: String = "AppHeader"
    
     let appHeaderVC : AppHeaderVC = AppHeaderVC()
    
   

    var feedArray : [Feed] = []{
        didSet{
            appHeaderVC.feedArray = feedArray
        }
    }
        
    // MARK: - İnitialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension AppHeaderView {
    private func setupUI(){
        configure()
    }
    
    private func configure(){
        addSubview(appHeaderVC.view)
        appHeaderVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
