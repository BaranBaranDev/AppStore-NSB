//
//  AppHeaderCell.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 21.04.2024.
//


import UIKit
import Kingfisher

final class AppHeaderCell: UICollectionViewCell {
    let viewModel : AppHeaderlViewModel = AppHeaderlViewModel()
    var feedResult : FeedResult? {
        didSet{
            viewModel.results = feedResult
            setupData()
            
        }
    }
    
    // MARK: - UI Elements
    private lazy var appImageView : UIImageView = CustomImageView()
    private lazy var appNameLabel : UILabel = CustomLabel()
    private lazy var companyNameLabel : UILabel = CustomLabel()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: - Properties
    static let reuseID : String = "AppHeaderCell"
    
    
    // MARK: - İnitialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupData(){
        guard self.feedResult != nil else {return}
        appNameLabel.text =  viewModel.appName
        companyNameLabel.text = viewModel.companyName
        appImageView.kf.setImage(with: viewModel.appImage)
    }
    
}


// MARK: - Setup UI
extension AppHeaderCell {
    private func setupUI(){
        drawDesign()
        configure()
    }
    
    private func drawDesign(){
        backgroundColor = Colors.systemBackground
    }
}


// MARK: - Configure
extension AppHeaderCell {
    private func configure(){
        addSubview(stackView)
        stackView.addArrangedSubviewFromExt(appNameLabel,companyNameLabel,appImageView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
 
        appImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}


