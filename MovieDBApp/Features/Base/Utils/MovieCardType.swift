//
//  MovieCardType.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/16/24.
//

import Foundation

enum MovieCardType {
    case poster, grid
}

extension MovieCardType {
    var widthPercent: Double {
        switch self {
        case .poster:
            return 0.45
        case .grid:
            return 0.30
        }
    }
    
    var heightPercent: Double {
        switch self {
        case .poster:
            return 0.60
        case .grid:
            return 0.30
        }
    }
}
