//
//  AppCell.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 21.04.2024.
//

import UIKit

final class AppCell: UICollectionViewCell {
    
    
    // MARK: - UI Elements
    private lazy var sectionLabel : UILabel = {
        let lbl = CustomLabel()
        lbl.customText = "Section Name"
        lbl.customFontSize = 24
        return lbl
    }()
    
    private lazy var appCellDetailVC : AppCellDetailVC = AppCellDetailVC()
    
    // MARK: - Properties
    static let reuseID : String = "AppCell"
      var feed : Feed? {
         didSet{
             setupData()
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


// MARK: - Setup UI
extension AppCell {
    private func setupUI(){
        drawDesign()
        configure()
    }
    
    private func drawDesign(){
        contentView.backgroundColor = Colors.systemBackground
    }
}


// MARK: - Configure
extension AppCell {
    private func configure(){
        makeSectionLabel()
        makeAppCellDetailVC()
    }
}


extension AppCell {
    private func makeSectionLabel(){
        addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
    }
    
    private func makeAppCellDetailVC(){
        addSubview(appCellDetailVC.view)
        appCellDetailVC.view.snp.makeConstraints { make in
            make.top.equalTo(sectionLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - Setup Data

extension AppCell {
    private func setupData(){
        guard let feed = self.feed else {return }
        sectionLabel.text = feed.title
        appCellDetailVC.results = feed.results
    }
}
