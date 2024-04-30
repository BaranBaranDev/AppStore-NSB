//
//  TestEndpoint.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 24.04.2024.
//

import Foundation

// MARK: - Model
struct HeaderModel: Codable {
    let id: String
    let name: String
    let title: String
    let imageUrl: String
}



// MARK: - RssEndpoint
enum TestEndpoint {
    case header
    
}

extension TestEndpoint: EndpointProtocol {
    var method: HTTPMethod {
        return .get
    }
    
    var term: String {
        return ""
    }
    
    func request() -> URLRequest {
        guard let url = URL(string: baseUrl + path) else {
            fatalError("URL Components Error")
        }
        // URLRequest oluştur ve HTTP metodu ata
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
    
    // Base URL'i döndürür
    var baseUrl: String {
        return "https://raw.githubusercontent.com"
    }

    // Yol bilgisini döndürür
    var path: String {
        switch self {
        case .header:
            return "/hakkicansengonul/hakkicansengonul.github.io/main/appstore/header"
        }
        
    }
}
// MARK: - Network

protocol HeaderProtocol {
    func getHeader(completion: @escaping (MyResult<[HeaderModel], NetworkError>) -> Void)
}

final class HeaderNetwork {
    static let shared = HeaderNetwork()
    private init(){}
    
    func getHeader(completion: @escaping (MyResult<[HeaderModel], NetworkError>) -> Void){
        NetworkManager.shared.request(TestEndpoint.header.request(), completion: completion)
    }
}
