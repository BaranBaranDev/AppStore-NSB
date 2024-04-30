//
//  MyResult.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 17.04.2024.
//

import Foundation

enum MyResult<T, E: Error> {
    case success(T)
    case failure(E)
}

