//
//  CalculatorVC.swift
//  Currency-converter
//
//  Created by Matt Deuschle on 9/19/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet var baseCurrencyAmountLabel: UITextField!
    @IBOutlet var selectedCurrencyAmountLabel: UITextField!
    @IBOutlet var selectedCountryLabel: UILabel!
    @IBOutlet var baseTextField: UITextField!
    @IBOutlet var selectedCurrencyTextField: UITextField!

    var rate: Rate!

    override func viewDidLoad() {
        super.viewDidLoad()

        print("RATE NAME: \(rate.countryCode)")

    }

    func stylizeView() {
        addDoneButton()
        baseTextField.font = .systemFont(ofSize: 32)
        selectedCurrencyTextField.font = .systemFont(ofSize: 32)
    }

    func addDoneButton() {
        let toolbarDone = UIToolbar()
        toolbarDone.sizeToFit()
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(CalculatorVC.dismissVC))
        toolbarDone.items = [doneBarButtonItem]
        baseTextField.inputAccessoryView = toolbarDone        
    }

    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }

}

