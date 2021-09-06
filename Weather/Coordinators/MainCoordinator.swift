//
//  MainCoordinator.swift
//  Weather
//
//  Created by Ivan Zakharov on 2/9/21.
//

import Foundation
import UIKit

final class MainCoordinator: WeatherModuleOutput {

    let window: UIWindow
    var navigationController: UINavigationController
    let weatherModule = WeatherModule()
    


    init(window: UIWindow) {
        self.window = window
        navigationController = .init(rootViewController: weatherModule.viewController)
        navigationController.navigationBar.isHidden = true
    }

    func start() {
        weatherModule.output = self
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
