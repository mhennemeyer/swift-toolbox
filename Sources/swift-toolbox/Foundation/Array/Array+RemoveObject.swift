//
//  File.swift
//  
//
//  Created by Matthias Hennemeyer on 09.09.20.
//

import Foundation

public extension Array where Element: Equatable {

    // Remove first collection element that is equal to the given `object`:
    mutating func remove(_ object: Element) {
        guard let index = firstIndex(of: object) else { return }
        remove(at: index)
    }

}
