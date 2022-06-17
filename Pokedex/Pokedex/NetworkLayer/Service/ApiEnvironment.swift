//
//  ApiEnvironment.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation

public enum ApiEnvironment: String {
    case production
    case development
   // case staging

    public static let allValues: [ApiEnvironment] = [.production, .development, /*.staging*/]
}

extension ApiEnvironment {
    var baseApiUrl: URL {
        switch self {
        case .development:
            return URL(string: "http://v1-api.apricot.delivery/")!
        case .production:
            return URL(string: "http://v1-api.apricot.delivery/")!
        }
    }
}
