//
//  MainCoordinator.swift
//  Weather
//
//  Created by Ivan Zakharov on 2/9/21.
//

import Foundation
import UIKit

final class MainCoordinator: WeatherModuleOutput, CitiesModuleOutput {

    let window: UIWindow
    var navigationController: UINavigationController
    let weatherModule = WeatherModule()
    let citiesModule = CitiesModule()

    init(window: UIWindow) {
        self.window = window
        navigationController = .init(rootViewController: weatherModule.viewController)
        navigationController.navigationBar.isHidden = true
    }

    func start() {
        weatherModule.output = self
        citiesModule.output = self
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    func weatherModuleCitiesModuleShow(_ moduleInput: WeatherModuleInput) {
        navigationController.present(citiesModule.viewController, animated: true)
    }
    func citiesModuleSendsCityId(id: String) {
        weatherModule.input.state.cityId = id
        weatherModule.input.updateWeather()
    }
}
