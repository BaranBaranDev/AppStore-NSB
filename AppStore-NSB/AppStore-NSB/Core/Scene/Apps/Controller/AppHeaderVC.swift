//
//  AppHeaderVC.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 21.04.2024.
//


import UIKit

final class AppHeaderVC: UICollectionViewController {
    
    var feedArray : [Feed] = []{didSet{collectionView.reloadData()}}
    
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
extension AppHeaderVC {
    private func setupUI(){
        drawDesign()
        
    }
    
    private func drawDesign(){
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: AppHeaderCell.reuseID)
    }

}


// MARK: - UICollectionViewDataSource
extension AppHeaderVC{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedArray.count
    }
}


extension AppHeaderVC {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppHeaderCell.reuseID, for: indexPath) as? AppHeaderCell else {
            fatalError("Could not dequeue reusable cell with identifier: \(AppHeaderCell.reuseID)")
        }
        // headerArray'den ilgili Feed nesnesini al
            let feed = feedArray[indexPath.section]
            
            // İlgili Feed nesnesinin results dizisinden ilgili FeedResult nesnesini al
            let feedResult = feed.results[indexPath.row]
            
            // Cell'e atama yap
            cell.feedResult = feedResult
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AppHeaderVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
    

}
