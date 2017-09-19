//
//  Currency.swift
//  Currency-converter
//
//  Created by Matt Deuschle on 9/19/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import Foundation

class Currency {

    private var _countryDic: [String: Any]!

    var countryDic: [String: Any] {
        return _countryDic ?? [String: Any]()
    }

    init(countryDic: [String: Any]) {
        self._countryDic = countryDic
    }
}







