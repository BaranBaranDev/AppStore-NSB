//
//  Search.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 16.04.2024.
//

import Foundation


struct Search: Codable {
    let resultCount: Int
    let results: [Result]
}
struct Result: Codable {
    let primaryGenreName: String
    let artworkUrl100: String
    let trackName: String
    let screenshotUrls: [String]
    var averageUserRating: Float?
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
    let trackId: Int
}
