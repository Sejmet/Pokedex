//
//  UseCase.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation
import Combine

protocol UseCase {
    associatedtype P
    associatedtype R
    func call(_ param: P) -> AnyPublisher<R, Error>
}

protocol NoParamUseCase {
    associatedtype R
    func call() -> AnyPublisher<R, Error>
}

protocol SyncUseCase {
    associatedtype R
    func call() -> R
}
