//
//  SearchCellVM.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 16.04.2024.
//

import Foundation


final class SearchCellVM {
    var result : Result
    init(searchResult: Result) {
        self.result = searchResult
    }
    
    var trackLabel : String{
        return result.trackName
    }
    var ratingLabel : String {
        String(format: "%.2f", result.averageUserRating ?? 0)
    }
    
    var categoryLabel: String{
        result.primaryGenreName
    }
    
    var appImage: URL?{
        return URL(string: result.artworkUrl100)
    }
    var screenshot1: URL?{
        guard let url = result.screenshotUrls[safe: 0] else {
            return nil // Belirtilen indekste URL yoksa nil döndür
        }
        return URL(string: url)
    }
    var screenshot2: URL?{
        guard let url = result.screenshotUrls[safe: 1] else {
            return nil // Belirtilen indekste URL yoksa nil döndür
        }
        return URL(string: url)
    }
    var screenshot3: URL? {
        guard let url = result.screenshotUrls[safe: 2] else {
            return nil // Belirtilen indekste URL yoksa nil döndür
        }
        return URL(string: url)
    }

   
}

