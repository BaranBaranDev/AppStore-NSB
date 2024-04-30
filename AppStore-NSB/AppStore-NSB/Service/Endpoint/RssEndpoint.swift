//
//  RssEndpoint.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 23.04.2024.
//

import Foundation



// MARK: - RssEndpoint
enum RssEndpoint {
    case topFreeApps
    case topPaidApps
    case topHeader
}

extension RssEndpoint: EndpointProtocol {
    // Base URL'i döndürür
    var baseUrl: String {
        return "https://rss.applemarketingtools.com"
    }
    
    // Yol bilgisini döndürür
    var path: String {
        switch self {
        case .topFreeApps:
            return "/api/v2/tr/apps/top-free/25/apps.json"
        case .topPaidApps:
            return "/api/v2/tr/apps/top-paid/25/apps.json"
        case .topHeader:
            return "/api/v2/us/apps/top-free/10/apps.json"
        }
    }
    
    // HTTP metodu belirler
    var method: HTTPMethod {
        return .get
    }
    
    // Arama terimini döndürür
    var term: String {
        // RssEndpoint için herhangi bir terim gerekmez, bu yüzden boş bir dize döndürebiliriz
        return ""
    }
    
    // URLRequest oluşturur
    func request() -> URLRequest {
        // URL bileşenlerini oluştur
        guard let url = URL(string: baseUrl + path) else {
            fatalError("URL Components Error")
        }
        // URLRequest oluştur ve HTTP metodu ata
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
