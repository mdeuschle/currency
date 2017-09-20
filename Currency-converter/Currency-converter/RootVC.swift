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
    @IBOutlet var spinner: UIActivityIndicatorView!
    var rates = [Rate]()

    override func viewDidLoad() {
        super.viewDidLoad()
        ratesTableView.delegate = self
        ratesTableView.dataSource = self
        rates.removeAll()
        spinner.isHidden = false
        spinner.startAnimating()
        CurrencyService.shared.getCurrencyData { (success, rates) in
            if success {
                DispatchQueue.main.async {
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                    if let unwrappedRates = rates {
                        self.rates = unwrappedRates
                        self.ratesTableView.reloadData()
                    }
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueString.goToCalculator.rawValue {
            if let destination = segue.destination as? CalculatorVC {
                guard let selectedRow = ratesTableView.indexPathForSelectedRow?.row else { return }
                destination.rate = rates[selectedRow]
            }
        }
    }
}

extension RootVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReusableCell.flag.rawValue) as? FlagCell else {
            return FlagCell()
        }
        let rate = rates[indexPath.row]
        cell.configCell(rate: rate)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueString.goToCalculator.rawValue, sender: nil)
    }
}
