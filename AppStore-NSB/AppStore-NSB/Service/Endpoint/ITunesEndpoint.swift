//
//  Endpoint.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 15.04.2024.
//

import Foundation

// https://itunes.apple.com/search?term=instagram&entity=software

// MARK: - EndpointProtocol
protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var term: String { get } // Dinamik arama terimi
    
    func request() -> URLRequest
}

// MARK: - HTTPMethod
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

// MARK: - ITunesEndpoint
enum ITunesEndpoint {
    case searchApp(term: String)
}

// MARK: - Endpoint && EndpointProtocol
extension ITunesEndpoint: EndpointProtocol {
    // Base URL'i döndürür
    var baseUrl: String {
        return "https://itunes.apple.com"
    }
    
    // Yol bilgisini döndürür
    var path: String {
        switch self {
        case .searchApp:
            return "/search"
        }
    }
    
    // HTTP metodu belirler
    var method: HTTPMethod {
        switch self {
        case .searchApp:
            return .get
        }
    }
    
    // Arama terimini döndürür
    var term: String {
        switch self {
        case .searchApp(let term):
            return term
        }
    }
    
    // URLRequest oluşturur
    func request() -> URLRequest {
        // URL bileşenlerini oluştur
        guard var urlComponents = URLComponents(string: baseUrl + path) else {
            fatalError("URL Components Error")
        }
        // Query parametrelerini ekle (örneğin, arama terimi)
        urlComponents.queryItems = [
            URLQueryItem(name: "term", value: term),
            URLQueryItem(name: "entity", value: "software")
        ]
        
        // Son URL'yi oluştur
        guard let finalUrl = urlComponents.url else {
            fatalError("Final URL Error")
        }
        // URLRequest oluştur ve HTTP metodu ata
        var request = URLRequest(url: finalUrl)
        request.httpMethod = method.rawValue
        return request
    }
}
