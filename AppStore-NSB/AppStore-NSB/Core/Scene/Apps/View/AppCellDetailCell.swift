//
//  AppCellDetailCell.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 21.04.2024.
//


import UIKit



final class AppCellDetailCell: UICollectionViewCell {

    // MARK: - UI Elements
    private lazy var appIconImageView : UIImageView = CustomImageView()
        
    private lazy var appNameLabel : UILabel = CustomLabel()
    
    private lazy var companyNameLabel : UILabel = CustomLabel()
    
    private lazy var getButton : UIButton = CustomButton(title: "Get")
    
    private lazy var labelStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - Properties
    static let reuseID : String = "AppCellDetailCell"
    
    // view model
    let vm = AppDetailCellViewModel()
    
    var results : FeedResult? {
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
extension AppCellDetailCell {
    private func setupUI(){
        drawDesign()
        configure()
    }
    
    private func drawDesign(){
        contentView.backgroundColor = Colors.systemBackground

    }
}


// MARK: - Configure
extension AppCellDetailCell {
    private func configure(){
        configureContent()
    }
}


extension AppCellDetailCell {
    private func configureContent(){
        addSubview(contentStackView)
        labelStack.addArrangedSubviewFromExt(appNameLabel,companyNameLabel)
        contentStackView.addArrangedSubviewFromExt(appIconImageView,labelStack,getButton)
        
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        appIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(64)
        }
        getButton.snp.makeConstraints { make in
            make.width.equalTo(72)
            make.height.equalTo(32)
        }
    }
   
}

// MARK: - setupData
extension AppCellDetailCell {
    private func setupData(){
        guard let results = self.results else {return}
        // dışarıdan alınacan results doldurduk
        vm.results = results
        // verileri görebiliriz
        appNameLabel.text = vm.appName
        companyNameLabel.text = vm.companyName
        appIconImageView.kf.setImage(with: vm.appImage)
        
    }
}

