//
//  WeatherModule.swift
//  Weather
//
//  Created by Ivan Zakharov on 2/9/21.
//

import Foundation

protocol WeatherModuleInput: AnyObject {
    var state: WeatherState { get }
    func updateWeather()
}

protocol WeatherModuleOutput: AnyObject {
    func weatherModuleCitiesModuleShow(_ moduleInput: WeatherModuleInput)
}

final class WeatherModule {

    var input: WeatherModuleInput {
        return presenter
    }
    var output: WeatherModuleOutput? {
        get {
            return presenter.output
        }
        set {
            presenter.output = newValue
        }
    }
    let viewController: WeatherViewController
    private let presenter: WeatherPresenter

    init(state: WeatherState = .init()) {
        let presenter = WeatherPresenter(state: state)
        let viewController = WeatherViewController(output: presenter)
        presenter.view = viewController
        self.viewController = viewController
        self.presenter = presenter
    }
}
