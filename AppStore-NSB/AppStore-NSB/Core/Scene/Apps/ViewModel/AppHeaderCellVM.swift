//
//  AppHeaderCellVM.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 24.04.2024.
//

import Foundation

// MARK: - AppHeaderlViewModelProtocol Protocol



protocol AppHeaderlViewModelProtocol {
    var results: FeedResult? { get set }
    var appName: String { get }
    var companyName: String { get }
    var appImage : URL? {get}
}



// MARK: - AppHeaderlViewModel

final class AppHeaderlViewModel: AppHeaderlViewModelProtocol {

    var results: FeedResult?
    init(results: FeedResult? = nil) {
        self.results = results
    }
    
    var appName: String {
        return results?.name ?? ""
    }
    
    var companyName: String {
        return results?.artistName ?? ""
    }
    
    var appImage : URL? {
        return URL(string: results?.artworkUrl100 ?? "") ?? nil
    }
 
}
