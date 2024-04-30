//
//  SearchCell.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 14.04.2024.
//

import UIKit
import Kingfisher

final class SearchCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID : String = "SearchCell"
    var searchResult : Result?{
        didSet{
            configureData()
        }
    }
    
    // MARK: - UI Elements
    private lazy var appImageView : UIImageView = CustomImageView()
    
    
    private lazy var nameLabel: UILabel =  CustomLabel()
    
    private lazy var categoryLabel: UILabel = CustomLabel()
    
    private lazy var ratingLabel: UILabel =  CustomLabel()
    
    private lazy var actionButton : UIButton = CustomButton(title: "Download")
    
    
    private lazy var imageView1 : UIImageView = CustomImageView()
    private lazy var imageView2 : UIImageView = CustomImageView()
    private lazy var imageView3 : UIImageView = CustomImageView()
    
    
    private let hStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    private let vStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()
    
    
    private let imageViewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    
    
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
extension SearchCell {
    private func setupUI(){
        drawDesign()
        configure()
    }
    
    private func drawDesign(){
        contentView.backgroundColor = .systemBackground
    }
}


// MARK: - Configure
extension SearchCell {
    private func configure(){
        makeVStack()
        makeHStack()
        makeImageViewStack()
    }
    
    private func makeVStack(){
        contentView.addSubview(vStack)
        vStack.addArrangedSubviewFromExt(nameLabel,categoryLabel,ratingLabel)
        
    }
    private func makeHStack(){
        contentView.addSubview(hStack)
        hStack.addArrangedSubviewFromExt(appImageView,vStack,actionButton)
        
        
        hStack.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            
        }
        
        appImageView.snp.makeConstraints { make in
            make.width.height.equalTo(64)
        }
        
        actionButton.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(44)
        }
    }
    
    private func makeImageViewStack(){
        contentView.addSubview(imageViewStack)
        imageViewStack.addArrangedSubviewFromExt(imageView1,imageView2,imageView3)
        
        imageViewStack.snp.makeConstraints { make in
            make.top.equalTo(hStack.snp.bottom).offset(5)
            make.trailing.equalTo(hStack.snp.trailing)
            make.leading.equalTo(hStack.snp.leading)
            make.bottom.equalToSuperview()
            make.height.equalTo(150)
        }
        
        
        
    }
}


extension SearchCell{
    private func configureData(){
        guard let results = self.searchResult else {return}
        let viewModel = SearchCellVM(searchResult: results)
        
        self.nameLabel.text = viewModel.trackLabel
        self.ratingLabel.text = viewModel.ratingLabel
        self.categoryLabel.text = viewModel.categoryLabel
        self.appImageView.kf.setImage(with: viewModel.appImage)
        self.imageView1.kf.setImage(with: viewModel.screenshot1)
        self.imageView2.kf.setImage(with: viewModel.screenshot2)
        self.imageView3.kf.setImage(with: viewModel.screenshot3)
    }
}
