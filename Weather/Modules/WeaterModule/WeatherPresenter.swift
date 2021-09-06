//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Ivan Zakharov on 2/9/21.
//

import Foundation
import Kingfisher

final class WeatherPresenter {

    weak var view: WeatherViewController?
    weak var output: WeatherModuleOutput?
    let networkService = NetworkService()
    var state: WeatherState
    init(state: WeatherState) {
        self.state = state
    }
    func getWindDirection(degrees: Double) -> String {
        switch degrees {
        case 348.75...350.0, 0...11.25:
            return "северный"
        case 11.26...78.75:
            return "северо-восточный"
        case 78.76...101.25:
            return "восточный"
        case 101.26...168.75:
            return "юго-восточный"
        case 168.76...191.25:
        return "южный"
        case 191.26...258.75:
            return "юго-западный"
        case 258.76...303.75:
            return "западный"
        case 303.76...348.74:
            return "северо-западный"
        default:
            return "южный"
        }
    }
    private func showLoadingView() {
        view?.activityIndicator.startAnimating()
        view?.activityIndicator.isHidden = false
        view?.activityIndicatorView.isHidden = false
    }

    private func hideLoadingView() {
        view?.activityIndicator.stopAnimating()
        view?.activityIndicator.isHidden = true
        view?.activityIndicatorView.isHidden = true
    }

    private func fetchWeather(cityId: String) {
showLoadingView()
        networkService.getWeather(city: cityId) { result in
            switch result {
            case .success(let response):
                self.hideLoadingView()
                self.view?.update(weather: response)
                guard let temp = response.weather.first,
                let icon = temp?.icon else {
                    return
                }
                let url = URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")
                self.view?.weatherImage.kf.setImage(with: url)
            case .failure(_):
                self.hideLoadingView()
            }
        }
    }
}

extension WeatherPresenter: WeatherViewOutput {
    func showCitiesScreen() {
        output?.weatherModuleCitiesModuleShow(self)
    }

    func viewDidLoad() {
fetchWeather(cityId: "1496153")
    }
}

extension WeatherPresenter: WeatherModuleInput {
    func updateWeather() {
        guard let id = state.cityId else {
            return
        }
        fetchWeather(cityId: id)
    }
}
