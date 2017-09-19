//
//  FlagCell.swift
//  Currency-converter
//
//  Created by Matt Deuschle on 9/19/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import UIKit

class FlagCell: UITableViewCell {

    @IBOutlet var flagImageView: UIImageView!
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var countryCurrencyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(rate: Rate) {
        countryNameLabel.text = rate.countryCode
        countryCurrencyLabel.text = String(rate.currentRate)
    }
}
