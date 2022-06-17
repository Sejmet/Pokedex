//
//  NetworkError.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation
import Alamofire

struct UnknownError: Error {
}

struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
    var localizedDescription: String {
        return backendError?.localizedDescription ?? initialError.localizedDescription
    }
}

struct BackendError: Codable, Error {
    let error: ErrorInfo
    var localizedDescription: String {
        return error.description
    }
}
struct ErrorInfo: Codable {
    let code: String
    let description: String
}
