//
//  AppDetailCellVM.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 23.04.2024.
//

import Foundation

// MARK: - AppDetailCellViewModel Protocol

protocol AppDetailCellViewModelDelegate: AnyObject {
    func didUpdateData()
}

protocol AppDetailCellViewModelProtocol {
    var delegate: AppDetailCellViewModelDelegate? { get set }
    var results: FeedResult? { get set }
    var appName: String { get }
    var companyName: String { get }
    var appImage : URL? {get}
}



// MARK: - AppDetailCellViewModel

final class AppDetailCellViewModel: AppDetailCellViewModelProtocol {
    var delegate: AppDetailCellViewModelDelegate?
    
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
