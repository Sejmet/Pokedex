//
//  PaginatedList.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation

struct PaginatedList<T> {
    let count: Int
    let results: [T]
    let next: String?
    
    static var empty: PaginatedList<T> {
        return PaginatedList(count: 0, results: [], next: nil)
    }
    
    func appendPage(_ page: PaginatedList<T>) ->  PaginatedList<T>{
        var items = self.results
        items.append(contentsOf: page.results)
        return PaginatedList(count: page.count, results: items, next: page.next)
    }
}
