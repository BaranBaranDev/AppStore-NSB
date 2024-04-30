//
//  App.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 23.04.2024.
//

import Foundation


struct App: Codable {
    let feed: Feed
}
struct Feed: Codable {
    let title: String
    let results: [FeedResult]
}
struct FeedResult: Codable {
    let name: String
    let artistName: String
    let artworkUrl100: String
    let id: String
}
