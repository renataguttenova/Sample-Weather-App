//
//  ForecastCell.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import AlamofireImage
import UIKit

class ForecastCell: UITableViewCell {
    // Outlets:
    @IBOutlet var forecastDayLabel: UILabel!
    @IBOutlet var forecastTemperatureLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(forecastData: ForecastWeather) {
        forecastDayLabel.text = "\(forecastData.day)"
        forecastTemperatureLabel.text = "\(Int(forecastData.temperature))" + "°"
    }
}
