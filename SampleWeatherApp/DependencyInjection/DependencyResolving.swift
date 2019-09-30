//
//  DependencyResolving.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import UIKit

protocol DependencyResolving {
    func resolveTabBarController() -> UITabBarController
    func resolveCurrentWeatherScene() -> CurrentWeatherControlling & UIViewController
    func resolveForecastScene() -> ForecastControlling & UIViewController
}

extension DependencyResolving {
    func resolveTabBarController() -> UITabBarController {
        let storyboard = UIStoryboard(name: "TabBarViewController", bundle: nil)
        // swiftlint:disable:next force_cast
        let viewController = storyboard.instantiateInitialViewController() as! TabBarViewController
        return viewController
    }

    func resolveCurrentWeatherScene() -> CurrentWeatherControlling & UIViewController {
        let storyboard = UIStoryboard(name: "CurrentWeatherViewController", bundle: nil)
        // swiftlint:disable:next force_cast
        let viewController = storyboard.instantiateInitialViewController() as! CurrentWeatherViewController
        return viewController
    }

    func resolveForecastScene() -> ForecastControlling & UIViewController {
        let storyboard = UIStoryboard(name: "ForecastViewController", bundle: nil)
        // swiftlint:disable:next force_cast
        let viewController = storyboard.instantiateInitialViewController() as! ForecastViewController
        return viewController
    }
}
