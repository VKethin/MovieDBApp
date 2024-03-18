//
//  String.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/16/24.
//

import Foundation

extension String {
    var capitalizeFirstletter: String {
        if self.count == 0 { return self }
        return prefix(1).uppercased() + dropFirst()
    }
}
