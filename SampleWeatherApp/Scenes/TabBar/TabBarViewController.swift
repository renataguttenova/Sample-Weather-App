//
//  TabBarViewController.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension TabBarViewController {
    func setupUI() {
        tabBar.barTintColor = UIColor.white
    }
}
