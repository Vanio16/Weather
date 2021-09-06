//
//  CitiesModule.swift
//  Weather
//
//  Created by Ivan Zakharov on 6/9/21.
//

import Foundation

protocol CitiesModuleInput: AnyObject {
    var state: CitiesState {get}
}

protocol CitiesModuleOutput: AnyObject {
    func citiesModuleSendsCityId(id: String)
}

final class CitiesModule {

    var input: CitiesModuleInput {
        return presenter
    }
    var output: CitiesModuleOutput? {
        get {
            return presenter.output
        }
        set {
            presenter.output = newValue
        }
    }
    let viewController: CitiesViewController
    private let presenter: CitiesPresenter

    init(state: CitiesState = .init()) {
        let presenter = CitiesPresenter(state: state)
        let viewController = CitiesViewController(output: presenter)
        presenter.view = viewController
        self.viewController = viewController
        self.presenter = presenter
    }
}
