//
//  NetworkError.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 17.04.2024.
//

import Foundation


enum NetworkError: Error {
    case unableToComplete
    case invalidResponse
    case invalidData
    case authenticationError
    case serverError(statusCode: Int)
    case decodingError(reason: String)
    
    var localizedDescription: String {
        switch self {
        case .unableToComplete:
            return "Unable to complete the request. Please check your internet connection."
        case .invalidResponse:
            return "Invalid response received from the server. Please try again later."
        case .invalidData:
            return "Invalid data received from the server. Please try again later."
        case .authenticationError:
            return "Authentication failed. Please check your credentials and try again."
        case .serverError(let statusCode):
            return "Server error occurred with status code \(statusCode)."
        case .decodingError(let reason):
            return "Decoding error occurred: \(reason)"
        }
    }
}


