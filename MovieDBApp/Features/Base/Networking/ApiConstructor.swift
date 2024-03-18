//
//  ApiConstructor.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/17/24.
//

import Foundation

typealias Parameters = [String: String]

struct ApiConstructor {
    let endpoint: Endpoint
    var params: Parameters = [:]
}
