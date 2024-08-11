//
//  Double+Extensions.swift
//  Tipsy
//
//  Created by PC Admin on 11/08/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

extension Float {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Float {
        let divisor = pow(10.0, Double(places))
        return Float((Double(self) * divisor).rounded() / divisor)
    }
}
