//
//  RootCoordinator.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import UIKit

class RootCoordinator: Coordinating {
    private weak var window: UIWindow?
    private let resolver: DependencyResolving

    // MARK: - Object life cycle

    init(window: UIWindow, resolver: DependencyResolving) {
        self.window = window
        self.resolver = resolver
    }

    func begin() -> UIViewController {
        return createMainController()
    }
}

private extension RootCoordinator {
    func set(rootController: UIViewController) {
        window?.rootViewController = rootController
    }

    func setMainScene() {
        let mainController = createMainController()
        set(rootController: mainController)
    }

    func createMainController() -> UIViewController {
        let tabBarController = resolver.resolveTabBarController()
        tabBarController.viewControllers = [
            beginCurrentWeather(),
            beginForecast()
        ]
        return tabBarController
    }

    func beginCurrentWeather() -> UIViewController {
        let navController = BlankNavigationViewController()
        let coordinator = CurrentWeatherCoordinator(navController: navController, resolver: resolver)
        let viewController = coordinator.begin()
        navController.viewControllers = [viewController]
        return navController
    }

    func beginForecast() -> UIViewController {
        let navController = BlankNavigationViewController()
        let coordinator = ForecastCoordinator(navController: navController, resolver: resolver)
        let viewController = coordinator.begin()
        navController.viewControllers = [viewController]
        return navController
    }
}
