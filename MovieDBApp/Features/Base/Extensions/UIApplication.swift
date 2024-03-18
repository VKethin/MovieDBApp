//
//  UIApplication.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/16/24.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
