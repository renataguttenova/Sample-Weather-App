//
//  BlankNavigationViewController.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import Alamofire
import CoreLocation
import UIKit

class BlankNavigationViewController: UINavigationController {}

extension BlankNavigationViewController {
    func setupUI() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationItem.title = "xxx"
    }
}
