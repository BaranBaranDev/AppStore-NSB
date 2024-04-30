//
//  TodayCell.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 29.04.2024.
//


import UIKit
class TodayCell: UICollectionViewCell {
     // MARK: - Properties
    
    static let reuseID = "TodayCell"
    var today: Today?{
        didSet{
            configure()
        }
    }
    private let detailImageView: UIImageView = CustomImageView()
    private let featureTitleLabel: UILabel = CustomLabel()
    private let titleLabel: UILabel = CustomLabel()
    private var labelStackView: UIStackView!
     // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension TodayCell{
    private func style(){
        backgroundColor = .white
        layer.cornerRadius = 14
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        labelStackView = UIStackView(arrangedSubviews: [featureTitleLabel,titleLabel])
        labelStackView.axis = .vertical
        labelStackView.spacing = 4
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(detailImageView)
        addSubview(labelStackView)
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: topAnchor),
            detailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelStackView.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    private func configure(){
        guard let today = self.today else { return }
        self.featureTitleLabel.text = today.featuredTitle
        self.titleLabel.text = today.headTitle
        self.detailImageView.image = UIImage(named: today.imageName)
    }
}
