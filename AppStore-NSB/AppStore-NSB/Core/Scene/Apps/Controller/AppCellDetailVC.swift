//
//  AppCellDetailsVC.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 21.04.2024.
//

import UIKit


final class AppCellDetailVC: UICollectionViewController {
    
    // MARK: - Properties
     var results : [FeedResult] = []{
        didSet{collectionView.reloadData()}
    }
    
    
    
    // MARK: - İnitialization
    
    init() {
        super.init(collectionViewLayout: CustomCollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Helpers
extension AppCellDetailVC {
    private func setupUI(){
        drawDesign()
    }
    
    private func drawDesign(){
        view.backgroundColor = Colors.systemBackground
        collectionView.register(AppCellDetailCell.self, forCellWithReuseIdentifier: AppCellDetailCell.reuseID)
        
    }
}


// MARK: - UICollectionViewDataSource
extension AppCellDetailVC{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
}

extension AppCellDetailVC{
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCellDetailCell.reuseID, for: indexPath) as? AppCellDetailCell else {fatalError("Failed to dequeue AppCellDetailCell ")}
        cell.results = results[indexPath.row]
        return cell
    }
}




// MARK: - UICollectionViewDelegateFlowLayout
extension AppCellDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.frame.width - 32
        let cellHeight = view.frame.height / 3 - 3
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}
