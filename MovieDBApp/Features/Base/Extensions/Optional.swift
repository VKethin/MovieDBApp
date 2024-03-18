//
//  Optional.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/16/24.
//

import Foundation

extension Optional where Wrapped == String {
    var stringValue: String {
        guard let self = self else { return "" }
        return self
    }
}
