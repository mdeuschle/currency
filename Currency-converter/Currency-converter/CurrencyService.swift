//
//  CurrencyService.swift
//  Currency-converter
//
//  Created by Matt Deuschle on 9/19/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import Foundation

class CurrencyService {

    static let shared = CurrencyService()

    func getCurrencyData(completion: @escaping (Bool, [Rate]?) -> ()) {

        guard let url = URL(string: URLString.calculationData.rawValue) else {
            completion(false, nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if data != nil && error == nil {
                do {
                    var rates = [Rate]()
                    if let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                        if let countryDic = object["rates"] as? [String: Any] {
                            for (code, rate) in countryDic {
                                if let rateDouble = rate as? Double {
                                    let rate = Rate(countryCode: code, currentRate: rateDouble)
                                    rates.append(rate)
                                }
                            }
                        }
                        completion(true, rates)
                    } else {
                        completion(false, nil)
                    }
                } catch {
                    print(error.localizedDescription)
                    completion(false, nil)
                }
            } else {
                print(error?.localizedDescription as Any)
                completion(false, nil)
            }
        }
        task.resume()
    }
}









