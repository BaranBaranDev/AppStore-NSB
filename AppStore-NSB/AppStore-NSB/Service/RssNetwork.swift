//
//  RssNetwork.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 23.04.2024.
//

import Foundation


// https://rss.applemarketingtools.com/api/v2/tr/apps/top-free/25/apps.json


// MARK: - RssNetworkProtocol
protocol RssNetworkProtocol {
    func fetchTopFreeApps(completion: @escaping (MyResult<App, NetworkError>) -> Void)
    func fetchTopPaidApps(completion: @escaping (MyResult<App, NetworkError>) -> Void)
    func fetchHeader(completion: @escaping (MyResult<App, NetworkError>) -> Void)
}

// MARK: - RssNetwork
final class RssNetwork {
    static let shared = RssNetwork()
    private init() {}
}

// MARK: -  Extensions RssNetwork
extension RssNetwork: RssNetworkProtocol {
    func fetchTopFreeApps(completion: @escaping (MyResult<App, NetworkError>) -> Void) {
        NetworkManager.shared.request(RssEndpoint.topFreeApps.request(), completion: completion)
    }
    func fetchTopPaidApps(completion: @escaping (MyResult<App, NetworkError>) -> Void) {
        NetworkManager.shared.request(RssEndpoint.topPaidApps.request(), completion: completion)
    }
    func fetchHeader(completion: @escaping (MyResult<App, NetworkError>) -> Void){
        NetworkManager.shared.request(RssEndpoint.topHeader.request(), completion: completion)
    }
    
}
