//
//  URLRequestBuilder.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation
import Alamofire
import Combine

protocol NetworkServiceProtocol: AnyObject {
    func execute<T: Decodable>(_ urlRequest: URLRequestBuilder) -> AnyPublisher<T, NetworkError>
}

extension NetworkServiceProtocol {
    func execute<T: Decodable>(_ urlRequest: URLRequestBuilder) -> AnyPublisher<T, NetworkError> {
        return AF.request(urlRequest).validate()
            .cURLDescription { description in
                print(description)
            }
            .publishDecodable(type: T.self)
            .setFailureType(to: NetworkError.self)
            .flatMap({ response -> AnyPublisher<T, NetworkError> in
                if let error = response.error {
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    let f = NetworkError(initialError: error, backendError: backendError)
                    return Fail<T, NetworkError>(outputType: T.self, failure: f).eraseToAnyPublisher()
                } else {
                    return Just<T>(response.value!).setFailureType(to: NetworkError.self).eraseToAnyPublisher()
                }
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}

class NetworkService: NetworkServiceProtocol {
    static let `default`: NetworkServiceProtocol = {
        var service = NetworkService()
        return service
    }()
}

