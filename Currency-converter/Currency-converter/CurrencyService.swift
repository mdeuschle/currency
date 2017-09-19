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

    func getCurrencyData(completion: @escaping (Bool) -> ()) {

        guard let url = URL(string: URLString.calculationData.rawValue) else {
            completion(false)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if data != nil && error == nil {
                do {
                    if let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                        print("OBJECT: \(object)")
                        completion(true)
                    } else {
                        completion(false)
                    }
                } catch {
                    print(error.localizedDescription)
                    completion(false)
                }
            } else {
                print(error?.localizedDescription as Any)
                completion(false)
            }
        }
        task.resume()
    }
}









