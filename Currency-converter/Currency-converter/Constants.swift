//
//  Constants.swift
//  Currency-converter
//
//  Created by Matt Deuschle on 9/19/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import Foundation

enum ReusableCell: String {
    case flag = "flagCell"
}

enum SegueString: String {
    case goToCalculator = "goToCalculator"
}

enum URLString: String {
    case calculationData = "http://api.fixer.io/latest?base=USD"
}
