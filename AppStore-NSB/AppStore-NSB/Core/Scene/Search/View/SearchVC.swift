//
//  SearchVC.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 14.04.2024.
//

import UIKit

// MARK: - SearchVCProtocol
protocol SearchVCProtocol {
    func fetchData(_ searchText: String)
}

// MARK: - SearchVC class

final class SearchVC: UICollectionViewController {
    // MARK: - Properties
    
    var searchResult : [Result] = []
    
    
    // MARK: - LifeCycle
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
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

extension SearchVC{
    private func setupUI(){
        drawDesign()
        setupSearchController()
        
    }
    
    private func drawDesign(){
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.reuseID)
        
    }
    
    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
}

// MARK: - UICollectionViewDataSource
extension SearchVC{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1 // Tek bir bölüm olduğunu belirtiyoruz
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResult.count // Her bölümde kaç hücre olduğunu belirtiyoruz
    }
    
}


extension SearchVC {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.reuseID, for: indexPath) as? SearchCell else {
            fatalError("Failed to dequeue SearchCell")
        }
        // hücre içinde ki properties o o anki searchResults veriyoruz
        cell.searchResult = searchResult[indexPath.row]
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension SearchVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height / 3) // hücrenin boyutunu belirtiyoruz
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 8) // başlık görünümünün yüksekliğini ayarladım.
    }
    
}

// MARK: - UISearchBarDelegate
extension SearchVC:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fetchData(searchText)
    }
}


// SearchVCProtocol
extension SearchVC: SearchVCProtocol {
    func fetchData(_ searchText: String){
        SearchNetwork.shared.fetchData(term: searchText) { [weak self] result in
            guard let self = self else { return } // Güvenli hale getirme
            switch result {
            case .success(let search):
                DispatchQueue.main.async {
                    self.searchResult = search.results
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                // Hata durumunu daha iyi işleyin, örneğin kullanıcıya bir hata mesajı gösterin
                let alertController = UIAlertController(title: "Error", message: "An error occurred: \(error)", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
    }
}




