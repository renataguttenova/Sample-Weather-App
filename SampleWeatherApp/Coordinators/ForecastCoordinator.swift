//
//  ForecastCoordinator.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import UIKit

protocol ForecastCoordinating {}

class ForecastCoordinator: ForecastCoordinating {
    private let resolver: DependencyResolving
    private weak var navController: UINavigationController?

    init(navController: UINavigationController, resolver: DependencyResolving) {
        self.navController = navController
        self.resolver = resolver
    }

    deinit {
        debugPrint("Forecast deinit")
    }

    func begin() -> UIViewController {
        var viewController = resolver.resolveForecastScene()
        viewController.coordinator = self
        return viewController
    }
}
