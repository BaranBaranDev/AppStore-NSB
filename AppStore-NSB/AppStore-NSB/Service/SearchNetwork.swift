//
//  SearchNetwork.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 17.04.2024.
//

import Foundation


// MARK: - SearchNetworkProtocol
protocol SearchNetworkProtocol {
    func fetchData(term searchText: String,completion: @escaping(MyResult<Search, NetworkError>) -> Void)
}

// MARK: - SearchManager
final class SearchNetwork{
    static let shared = SearchNetwork()
    private init(){}
}

// MARK: -  Extensions SearchNetwork
extension SearchNetwork: SearchNetworkProtocol {
    func fetchData(term : String, completion: @escaping (MyResult<Search, NetworkError>) -> Void) {
        NetworkManager.shared.request(ITunesEndpoint.searchApp(term: term).request(), completion: completion)
    }
}




