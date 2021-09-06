//
//  WeatherViewController.swift
//  Weather
//
//  Created by Ivan Zakharov on 2/9/21.
//

import Foundation
import UIKit
import Framezilla

protocol WeatherViewOutput {
func viewDidLoad()
}

final class WeatherViewController: UIViewController {

    private struct Constants {
        static let cityLabelInsetTop: CGFloat = 19
        static let cityLabelInsetLeft: CGFloat = 19
        static let changeCityButtonInsetTop: CGFloat = 18
        static let changeCityButtonInsetLeft: CGFloat = 21
        static let changeCityButtonSize: CGSize = .init(width: 105, height: 18)
        static let mylocateButtonInsetTop: CGFloat = 18
        static let myLocateButtonInsetRight: CGFloat = 20
        static let myLocateButtonSize: CGSize = . init(width: 154, height: 18)
    }
    private let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 114, green: 144, blue: 185)
        return view
    }()
    private let cityLabel: UILabel = {
       let label = UILabel()
        label.text = "Омск"
        label.font = UIFont(name: "Lato-Light", size: 45)
        label.textColor = .white
        return label
    }()
    private let changeCityButton: UIButton = {
       let button = UIButton()
        button.setTitle("Сменить город", for: .normal)
        button.titleLabel?.font = UIFont(name: "Lato-Light", size: 18)
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()
    private let myLocateButton: UIButton = {
       let button = UIButton()
        button.setTitle("Мое местоположение", for: .normal)
        button.titleLabel?.font = UIFont(name: "Lato-Light", size: 18)
        button.setTitleColor(.darkGray, for: .normal)
//        button.setImage(UIImage(named: "Arrow"), for: .normal)
//        button.imageView?.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
//        button.imageEdgeInsets.left = 0
        return button
    }()
    private let temperatureLabel: UILabel = {
       let label = UILabel()
        label.text = "14º"
        label.font = UIFont(name: "Lato-Light", size: 90)
        label.textColor = .white
        return label
    }()
    let weatherImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Arrow")
        imageView.image = image
        return imageView
    }()
    private let weaterLabel: UILabel = {
       let label = UILabel()
        label.text = "Дождь"
        label.font = UIFont(name: "Lato-Light", size: 30)
        label.textColor = .white
        return label
    }()
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "Влажность"
        label.font = UIFont(name: "Lato-Light", size: 20)
        label.textColor = .lightGray
        return label
    }()
    private let humidityValueLabel: UILabel  = {
        let label = UILabel()
        label.text = "1%"
        label.font = UIFont(name: "Lato-Light", size: 24)
        label.textColor = .white
        return label
    }()
    private let chanceOfRainLabel: UILabel  = {
        let label = UILabel()
        label.text = "Вероятность дождя"
        label.font = UIFont(name: "Lato-Light", size: 20)
        label.textColor = .lightGray
        return label
    }()
    private let chanceOfRainValueLabel: UILabel  = {
        let label = UILabel()
        label.text = "100%"
        label.font = UIFont(name: "Lato-Light", size: 24)
        label.textColor = .white
        return label
    }()
    private let windLabel: UILabel  = {
        let label = UILabel()
        label.text = "Ветер"
        label.font = UIFont(name: "Lato-Light", size: 20)
        label.textColor = .lightGray
        return label
    }()
    private let windValueLabel: UILabel  = {
        let label = UILabel()
        label.text = "5 м/с"
        label.font = UIFont(name: "Lato-Light", size: 24)
        label.textColor = .white
        return label
    }()
    private let pressureLabel: UILabel  = {
        let label = UILabel()
        label.text = "Давление"
        label.font = UIFont(name: "Lato-Light", size: 20)
        label.textColor = .lightGray
        return label
    }()
    private let pressureValueLabel: UILabel  = {
        let label = UILabel()
        label.text = "454 мм"
        label.font = UIFont(name: "Lato-Light", size: 24)
        label.textColor = .white
        return label
    }()

    private let output: WeatherViewOutput

// MARK: - Subviews

    // MARK: - Lifecycle

    init(output: WeatherViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.add(backgroundView, cityLabel, changeCityButton, myLocateButton, weatherImage, temperatureLabel, humidityValueLabel, humidityLabel, windValueLabel, windLabel, pressureLabel, pressureValueLabel, chanceOfRainLabel, chanceOfRainValueLabel, weaterLabel)
        output.viewDidLoad()
    }

    // MARK: - Layout

    override func viewDidLayoutSubviews() {
        backgroundView.configureFrame { maker in
            maker.top()
                .bottom()
                .left()
                .right()
        }
        cityLabel.configureFrame { maker in
            maker.top(to: view.nui_safeArea.top, inset: Constants.cityLabelInsetTop)
                .left(to: view.nui_safeArea.left, inset: Constants.cityLabelInsetLeft)
                .sizeToFit()
        }
        changeCityButton.configureFrame { maker in
            maker.top(to: cityLabel.nui_bottom, inset: Constants.changeCityButtonInsetTop)
                .left(to: view.nui_safeArea.left, inset: Constants.changeCityButtonInsetLeft)
                .sizeToFit()
        }
        myLocateButton.configureFrame { maker in
            maker.centerY(to: changeCityButton.nui_centerY)
                .right(to: view.nui_safeArea.right, inset: Constants.myLocateButtonInsetRight)
                .sizeToFit()
        }
        weatherImage.configureFrame { maker in
            maker.centerY()
                .size(width: 90, height: 90)
                .left(inset: 70)
        }
        temperatureLabel.configureFrame { maker in
            maker.centerY()
                .left(to: weatherImage.nui_right, inset: 20)
                .right()
                .sizeToFit()
        }
        weaterLabel.configureFrame { maker in
            maker.centerX()
                .top(to: weatherImage.nui_bottom, inset: 20)
                .sizeToFit()
        }
        humidityValueLabel.configureFrame { maker in
            maker.bottom(inset: 40)
                .left(inset: 21)
                .right(to: weaterLabel.nui_left)
                .sizeToFit()
        }
        humidityLabel.configureFrame { maker in
            maker.bottom(to: humidityValueLabel.nui_top, inset: 2)
                .left(inset: 21)
                .sizeToFit()
        }
        windValueLabel.configureFrame { maker in
            maker.bottom(to: humidityLabel.nui_top, inset: 40)
                .left(inset: 21)
                .sizeToFit()
        }
        windLabel.configureFrame { maker in
            maker.bottom(to: windValueLabel.nui_top, inset: 2)
                .left(inset: 21)
                .sizeToFit()
        }
        pressureLabel.configureFrame { maker in
            maker.left(to: windLabel.nui_right, inset: 120)
                .centerY(to: windLabel.nui_centerY)
                .sizeToFit()
        }
        pressureValueLabel.configureFrame { maker in
            maker.top(to: pressureLabel.nui_bottom, inset: 2)
            maker.left(to: pressureLabel.nui_left)
                .right()
                .sizeToFit()
        }
        chanceOfRainLabel.configureFrame { maker in
            maker.top(to: pressureValueLabel.nui_bottom, inset: 40)
            maker.left(to: pressureLabel.nui_left)
                .sizeToFit()
        }
        chanceOfRainValueLabel.configureFrame { maker in
            maker.top(to: chanceOfRainLabel.nui_bottom, inset: 2)
            maker.left(to: pressureLabel.nui_left)
                .sizeToFit()
        }

    }
    func update(weather: WeatherModel) {
        guard let temp = weather.main?.temp,
              let humidity = weather.main?.humidity,
              let pressure = weather.main?.pressure,
              let currentWeather = weather.weather.first,
              let description = currentWeather?.description,
              let speed = weather.wind?.speed else {
            return
        }
        temperatureLabel.text = "\(Int(temp))º"
        humidityValueLabel.text = "\(Int(humidity)) %"
        pressureValueLabel.text = "\(Int(pressure / 1.333)) мм.рт.ст"
        weaterLabel.text = description
        windValueLabel.text = "\(Int(speed)) м/c"
    }
}
