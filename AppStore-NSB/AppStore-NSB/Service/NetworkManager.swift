//
//  NetworkManager.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 15.04.2024.
//

import Foundation

// MARK: - NetworkManagerProtocol
protocol NetworkManagerProtocol {
    func request<T: Codable>(_ request: URLRequest, completion: @escaping (MyResult<T, NetworkError>) -> Void)
}

// MARK: - NetworkManager
final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
}

// MARK: - NetworkManager & NetworkManagerProtocol
extension NetworkManager: NetworkManagerProtocol {
    func request<T: Codable>(_ request: URLRequest, completion: @escaping (MyResult<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                let statusCode = httpResponse.statusCode
                completion(.failure(.serverError(statusCode: statusCode)))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let error {
                completion(.failure(.decodingError(reason: error.localizedDescription)))
            }
        }.resume()
    }
}
