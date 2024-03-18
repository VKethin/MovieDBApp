//
//  Poppins.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/16/24.
//

import Foundation

enum Poppins: String {
    case black, bold, light, medium, regular, semiBold
    
    var fontName: String {
        "Poppins-\(self.rawValue.capitalizeFirstletter)"
    }
}
