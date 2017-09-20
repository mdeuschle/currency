//
//  Rate.swift
//  Currency-converter
//
//  Created by Matt Deuschle on 9/19/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import Foundation

struct Rate {
    private var _countryCode: String!
    private var _currentRate: Double!

    var countryCode: String {
        return _countryCode ?? ""
    }

    var currentRate: Double {
        return _currentRate ?? 0.0
    }

    init(countryCode: String, currentRate: Double) {
        _countryCode = countryCode
        _currentRate = currentRate
    }

    func calculateRate(baseRate: Double) -> Double {
        let tempInt = Int(_currentRate * baseRate * 100)
        return Double(tempInt) / 100
    }
}



