//
//  AppsVC.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 21.04.2024.
//

import UIKit

final class AppsVC: UICollectionViewController {
    
    // MARK: - Properties
    
    var feedArray : [Feed] = []
   
    
    
    // MARK: - İnitialization
    
     init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
}

// MARK: - Helpers
extension AppsVC {
    private func setupUI(){
        drawDesign()
    }
    
    private func drawDesign(){
        view.backgroundColor = Colors.systemBackground
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: AppCell.reuseID)
        collectionView.register(AppHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppHeaderView.reuseID) //  görünümünde bir "supplementary view" kullanmak için kayıt işlemi gerçekleştirir.
    }
}


// MARK: - UICollectionViewDataSource
extension AppsVC{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedArray.count
    }
}

extension AppsVC{
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCell.reuseID, for: indexPath) as? AppCell else { fatalError("Failed to dequeue AppCell")}
        cell.feed = feedArray[indexPath.row]
        return cell
    }
}

extension AppsVC {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppHeaderView.reuseID, for: indexPath) as? AppHeaderView else {fatalError("Failed to dequeue AppHeaderView")}
        header.feedArray = feedArray
        return header
    }
}
// MARK: - UICollectionViewDelegateFlowLayout

extension AppsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250) // collection view hücresini boyutlandırdık
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 250) // collection view headerini boyutlandırdık

    }
}


// MARK: - Fetch data

extension AppsVC {
    private func fetchData() {
        // Tüm isteklerin tamamlanmasını bekleyecek bir grup oluşturalım
        let group = DispatchGroup()
        
        // Ücretsiz uygulamaları çekme isteği
        group.enter()
        RssNetwork.shared.fetchTopFreeApps { [weak self] result in
            guard let self = self else { return }
            defer { group.leave() }
            switch result {
            case .success(let data):
                self.feedArray.append(data.feed)
            case .failure(let e):
                print(e)
            }
        }
        
        // Ücretli uygulamaları çekme isteği
        group.enter()
        RssNetwork.shared.fetchTopPaidApps { [weak self] result in
            guard let self = self else { return }
            defer { group.leave() }
            switch result {
            case .success(let data):
                self.feedArray.append(data.feed)
            case .failure(let e):
                print(e)
            }
        }
        
        // Header'ı çekme isteği
        group.enter()
        RssNetwork.shared.fetchHeader { [weak self] result in
            guard let self = self else { return }
            defer { group.leave() }
            switch result {
            case .success(let data):
                self.feedArray.append(data.feed)
            case .failure(let e):
                print(e)
            }
        }
        
        // Tüm istekler tamamlandığında koleksiyon görünümünü yeniden yükle
        group.notify(queue: .main) {
            self.collectionView.reloadData()
        }
    }
}




