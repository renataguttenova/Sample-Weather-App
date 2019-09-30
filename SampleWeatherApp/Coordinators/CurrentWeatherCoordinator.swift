//
//  CurrentWeatherCoordinator.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import UIKit

protocol CurrentWeatherCoordinating {}

class CurrentWeatherCoordinator: CurrentWeatherCoordinating {
    private let resolver: DependencyResolving
    private weak var navController: UINavigationController?

    init(navController: UINavigationController, resolver: DependencyResolving) {
        self.navController = navController
        self.resolver = resolver
    }

    deinit {
        debugPrint("Current deinit")
    }

    func begin() -> UIViewController {
        var viewController = resolver.resolveCurrentWeatherScene()
        viewController.coordinator = self
        return viewController
    }
}
