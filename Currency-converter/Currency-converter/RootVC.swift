//
//  RootVC.swift
//  Currency-converter
//
//  Created by Matt Deuschle on 9/19/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import UIKit

class RootVC: UIViewController {

    @IBOutlet var ratesTableView: UITableView!
    var rates = [Rate]()

    override func viewDidLoad() {
        super.viewDidLoad()
        rates.removeAll()
        CurrencyService.shared.getCurrencyData { (success, rates) in
            if success {
                if let unwrappedRates = rates {
                    self.rates = unwrappedRates
                    self.ratesTableView.reloadData()
                }
            }
        }
    }
}

extension RootVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return FlagCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueString.goToCalculator.rawValue, sender: nil)
    }
}
